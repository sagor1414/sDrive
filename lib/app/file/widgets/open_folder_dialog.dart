import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sdrive/app/home/view/home.dart';
import 'package:sdrive/general/utils/color.dart';
import 'package:sdrive/general/utils/fonts_style.dart';
import 'package:sdrive/general/utils/utils.dart';

// ignore: non_constant_identifier_names
OpenAddFolderDialog(context) {
  TextEditingController folderController = TextEditingController();
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        actionsPadding: const EdgeInsets.only(right: 20, bottom: 20),
        title: Text(
          "New folder",
          style: textStyle(17, Colors.black, FontWeight.w600),
        ),
        content: TextFormField(
          controller: folderController,
          autofocus: true,
          style: textStyle(17, Colors.black, FontWeight.w600),
          decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey[250],
              hintText: "Untitled Folder",
              hintStyle: textStyle(16, Colors.grey, FontWeight.w500)),
        ),
        actions: [
          InkWell(
            onTap: () => Get.back(),
            child: Text(
              "Cancle",
              style: textStyle(16, Colors.deepOrangeAccent, FontWeight.bold),
            ),
          ),
          InkWell(
            onTap: () {
              userCollection
                  .doc(FirebaseAuth.instance.currentUser!.uid)
                  .collection('folders')
                  .add({"name": folderController.text, "time": DateTime.now()});
              Get.offAll(const Home());
            },
            child: Text(
              "Create",
              style: textStyle(16, textColor, FontWeight.bold),
            ),
          ),
        ],
      );
    },
  );
}
