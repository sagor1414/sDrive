// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:sdrive/app/file/model/file_model.dart';
import 'package:sdrive/general/utils/utils.dart';

class FileController extends GetxController {
  final String type;
  final String foldername;
  final String fileType;
  FileController(this.type, this.foldername, this.fileType);

  String uid = FirebaseAuth.instance.currentUser!.uid;

  RxList<FileModel> files = <FileModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    if (type == "files") {
      files.bindStream(userCollection
          .doc(uid)
          .collection('files')
          .where('fileType', isEqualTo: fileType)
          .snapshots()
          .map((QuerySnapshot query) {
        List<FileModel> tempFiles = [];
        List<QueryDocumentSnapshot<Object?>> docslist = query.docs;
        for (var element in docslist) {
          tempFiles.add(FileModel.fromDocumentSnapshot(element));
        }
        return tempFiles;
      }));
    } else {
      files.bindStream(userCollection
          .doc(uid)
          .collection('files')
          .where('folder', isEqualTo: foldername)
          .snapshots()
          .map((QuerySnapshot query) {
        List<FileModel> tempfiles = [];
        query.docs.forEach((element) {
          tempfiles.add(FileModel.fromDocumentSnapshot(element));
        });
        return tempfiles;
      }));
    }
  }
}

class FilesBinding implements Bindings {
  final String type;
  final String foldername;
  final String fileType;
  FilesBinding(this.type, this.foldername, this.fileType);

  @override
  void dependencies() {
    Get.lazyPut<FileController>(
        () => FileController(type, foldername, fileType));
  }
}
