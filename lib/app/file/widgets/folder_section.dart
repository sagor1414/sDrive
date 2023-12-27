import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sdrive/app/display_file/view/display_file_screen.dart';
import 'package:sdrive/app/file/controller/files_screen_controller.dart';
import 'package:sdrive/app/widgets/loading_indicator.dart';
import 'package:sdrive/general/utils/color.dart';
import 'package:sdrive/general/utils/fonts_style.dart';
import 'package:sdrive/general/utils/utils.dart';

import '../../display_file/controller/display_file_controller.dart';

class FolderScetion extends StatelessWidget {
  const FolderScetion({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<FileScreenController>(
        builder: (FileScreenController foldersController) {
      // ignore: unnecessary_null_comparison
      if (foldersController != null && foldersController.folderList != null) {
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: foldersController.folderList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 20, mainAxisSpacing: 22),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Get.to(
                  () => DisplayFileScreen(
                    title: foldersController.folderList[index].name,
                    type: "folder",
                  ),
                  binding: FilesBinding(
                    "Folders",
                    foldersController.folderList[index].name,
                    foldersController.folderList[index].name,
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade100,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.001),
                        offset: const Offset(10, 10),
                        blurRadius: 10)
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/icons/folder.png',
                      height: 82,
                      width: 82,
                      fit: BoxFit.cover,
                    ),
                    Text(
                      foldersController.folderList[index].name,
                      style: textStyle(18, textColor, FontWeight.bold),
                    ),
                    StreamBuilder<QuerySnapshot>(
                        stream: userCollection
                            .doc(FirebaseAuth.instance.currentUser!.uid)
                            .collection('files')
                            .where('folder',
                                isEqualTo:
                                    foldersController.folderList[index].name)
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return Loadingindicator(
                                color: Colors.deepOrangeAccent);
                          }
                          return Text(
                            "${snapshot.data!.docs.length} items",
                            style: textStyle(
                                14, Colors.grey[400]!, FontWeight.bold),
                          );
                        }),
                  ],
                ),
              ),
            );
          },
        );
      } else {
        return Loadingindicator(color: Colors.deepOrangeAccent);
      }
    });
  }
}
