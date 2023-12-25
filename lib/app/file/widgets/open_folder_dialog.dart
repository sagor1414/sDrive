import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sdrive/general/utils/color.dart';
import 'package:sdrive/general/utils/fonts_style.dart';

// ignore: non_constant_identifier_names
OpenAddFolderDialog(context) {
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
            onTap: () {},
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
