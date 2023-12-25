import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sdrive/app/home/controller/navigation_controller.dart';
import 'package:sdrive/general/utils/color.dart';
import 'package:sdrive/general/utils/fonts_style.dart';
import 'package:velocity_x/velocity_x.dart';

import 'tabcell.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    NavigationController navController = Get.put(NavigationController());
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          Text(
            "S-drive",
            style: textStyle(28, textColor, FontWeight.bold),
          ),
          20.heightBox,
          Container(
            width: context.screenWidth,
            height: 60,
            margin: const EdgeInsets.only(left: 20, right: 20),
            decoration: BoxDecoration(color: Colors.grey.shade100, boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.03),
                  offset: const Offset(10, 10),
                  blurRadius: 10),
              BoxShadow(
                  color: Colors.black.withOpacity(0.03),
                  offset: const Offset(-10, 10),
                  blurRadius: 10),
            ]),
            child: Obx(
              () => Row(
                children: [
                  InkWell(
                      onTap: () => navController.changeTab("Storage"),
                      child: tabcell("Storage",
                          navController.tab.value == "Storage", context)),
                  InkWell(
                      onTap: () => navController.changeTab("Files"),
                      child: tabcell("Files",
                          navController.tab.value == "Files", context)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
