import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:sdrive/general/utils/utils.dart';

class StorageController extends GetxController {
  String uid = FirebaseAuth.instance.currentUser!.uid;
  RxInt size = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getStorage();
  }

  getStorage() async {
    size.bindStream(userCollection
        .doc(uid)
        .collection('files')
        .snapshots()
        .map((QuerySnapshot query) {
      int size = 0;
      // ignore: avoid_function_literals_in_foreach_calls
      query.docs.forEach((element) {
        size = size + extractsize(element);
      });
      return size;
    }));
  }

  int extractsize(QueryDocumentSnapshot<Object?> element) {
    return element['size'];
  }
}
