import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sdrive/app/display_file/controller/display_file_controller.dart';
import 'package:sdrive/app/display_file/view/display_file_screen.dart';

Widget colorContainer(Color bgColor, Icon icon, String option, String title) {
  return InkWell(
    onTap: () => Get.to(() => DisplayFileScreen(title: title, type: 'files'),
        binding: FilesBinding('files', '', option)),
    child: Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: bgColor,
      ),
      child: Center(
        child: icon,
      ),
    ),
  );
}
