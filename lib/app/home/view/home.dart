import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sdrive/app/file/view/file_screen.dart';
import 'package:sdrive/app/home/controller/navigation_controller.dart';

import '../../widgets/header.dart';
import '../../widgets/storage_scrren.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(25),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      body: Column(
        children: [
          const Header(),
          Obx(
            () => Get.find<NavigationController>().tab.value == "Storage"
                ? const StorageScreen()
                : const FileScreen(),
          )
        ],
      ),
    );
  }
}
