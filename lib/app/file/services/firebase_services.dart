import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:mime/mime.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sdrive/app/file/model/file_model.dart';
import 'package:sdrive/general/utils/utils.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:video_compress/video_compress.dart';

class FirebaseService {
  Uuid uuid = const Uuid();
  Future<File?> compressFile(File file, String fileType) async {
    if (fileType == "image") {
      Directory directory = await getTemporaryDirectory();
      String targetpath = "${directory.path}/${uuid.v4().substring(0, 8)}.jpg";
      final result = await FlutterImageCompress.compressAndGetFile(
        file.path,
        targetpath,
        quality: 75,
      );
      return result;
    } else if (fileType == "video") {
      MediaInfo? info = await VideoCompress.compressVideo(file.path,
          quality: VideoQuality.MediumQuality,
          deleteOrigin: false,
          includeAudio: true);
      return File(info!.path!);
    } else {
      return file;
    }
  }

  uploadFile(context, String foldername) async {
    try {
      FilePickerResult? result =
          await FilePicker.platform.pickFiles(allowMultiple: true);
      if (result != null) {
        List<File> files = result.paths.map((path) => File(path!)).toList();

        for (File file in files) {
          //getting fle type
          String? fileType = lookupMimeType(file.path);
          String end = "/";
          int startIndex = 0;
          int endIndex = fileType!.indexOf(end);
          String filterFIletype = fileType.substring(startIndex, endIndex);

          //filtering file name and extension
          String fileName = file.path.split('/').last;
          String fileExtension = fileName.substring(fileName.indexOf('.') + 1);
          log(fileExtension);

          //getting compress file
          File? compressedfile = (await compressFile(file, filterFIletype));

          //getting length of files collection
          int length = await userCollection
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .collection('files')
              .get()
              .then((value) => value.docs.length);

          //uploading file to firebase storage
          UploadTask uploadTask = FirebaseStorage.instance
              .ref()
              .child('files')
              .child('File$length')
              .putFile(compressedfile!);

          TaskSnapshot snapshot = await uploadTask.whenComplete(() {});

          String fileUrl = await snapshot.ref.getDownloadURL();

          //saving data in firebase document
          userCollection
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .collection('files')
              .add({
            "fileName": fileName,
            "fileUrl": fileUrl,
            "fileType": filterFIletype,
            "fileExtension": fileExtension,
            "folder": foldername,
            "size":
                (compressedfile.readAsBytesSync().lengthInBytes / 1024).round(),
            "dateUploaded": DateTime.now()
          });
          log('upload complete');
        }
        if (foldername == '') {
          VxToast.show(context, msg: "Upload complete");
        }
      } else {
        log("canceled");
      }
    } catch (e) {
      log('error is $e');
    }
  }

  downloadfile(FileModel file) async {
    try {
      final downloadpath = await getdownloadpath();
      final path = "$downloadpath/${file.name.replaceAll(" ", "")}";
      var status = await Permission.storage.status;
      if (!status.isGranted) {
        await Permission.storage.request();
      }
      await Dio().download(file.url, path);
      log("Succes");
    } catch (e) {
      log("error is $e");
    }
  }

  Future<String?> getdownloadpath() async {
    Directory? directory;
    try {
      if (Platform.isIOS) {
        directory = await getApplicationDocumentsDirectory();
      } else {
        directory = Directory('storage/emulated/0/Download');
        if (!await directory.exists()) {
          directory = await getExternalStorageDirectory();
        }
      }
    } catch (e) {
      log("Cannot get download path");
    }
    // ignore: avoid_print
    print(directory?.path);
    return directory?.path;
  }

  deleteFile(FileModel file) async {
    await userCollection
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('files')
        .doc(file.id)
        .delete();
  }
}
