import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:sdrive/app/file/controller/model/folder_model.dart';
import 'package:sdrive/general/utils/utils.dart';

class FileScreenController extends GetxController {
  String uid = FirebaseAuth.instance.currentUser!.uid;
  RxList<FolderModel> folderList = <FolderModel>[].obs;
  @override
  void onInit() {
    super.onInit();
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
