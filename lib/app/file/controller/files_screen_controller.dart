import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:sdrive/app/file/model/file_model.dart';
import 'package:sdrive/app/file/model/folder_model.dart';
import 'package:sdrive/general/utils/utils.dart';

class FileScreenController extends GetxController {
  String uid = FirebaseAuth.instance.currentUser!.uid;
  RxList<FolderModel> folderList = <FolderModel>[].obs;
  RxList<FileModel> recentfilesList = <FileModel>[].obs;
  @override
  void onInit() {
    super.onInit();
    recentfilesList.bindStream(userCollection
        .doc(uid)
        .collection('files')
        .orderBy('dateUploaded', descending: true)
        .snapshots()
        .map((QuerySnapshot query) {
      List<FileModel> files = [];
      query.docs.forEach((element) {
        files.add(FileModel.fromDocumentSnapshot(element));
      });
      return files;
    }));

    folderList.bindStream(userCollection
        .doc(uid)
        .collection('folders')
        .orderBy('time', descending: true)
        .snapshots()
        .map((QuerySnapshot query) {
      List<FolderModel> folders = [];
      // ignore: avoid_function_literals_in_foreach_calls
      query.docs.forEach((element) {
        FolderModel folder = FolderModel.fromDocumentSnapshot(element);
        folders.add(folder);
      });
      return folders;
    }));
  }
}
