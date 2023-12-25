import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:sdrive/general/utils/fonts_style.dart';
import 'package:velocity_x/velocity_x.dart';

import '../widgets/folder_section.dart';
import '../widgets/open_folder_dialog.dart';
import '../widgets/recentfile.dart';

class FileScreen extends StatelessWidget {
  const FileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
        child: Stack(
          children: [
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  const RecentFile(),
                  20.heightBox,
                  const FolderScetion(),
                ],
              ),
            ),
            Positioned(
              right: 20,
              bottom: 20,
              child: Center(
                child: InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(10))),
                      builder: (context) {
                        return Padding(
                          padding: const EdgeInsets.all(18),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap: () {
                                  OpenAddFolderDialog(context);
                                },
                                child: Row(
                                  children: [
                                    const Icon(
                                      EvaIcons.folderAdd,
                                      color: Colors.grey,
                                      size: 32,
                                    ),
                                    5.widthBox,
                                    Text(
                                      "Folder",
                                      style: textStyle(
                                          20, Colors.black, FontWeight.w600),
                                    )
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () {},
                                child: Row(
                                  children: [
                                    const Icon(
                                      EvaIcons.upload,
                                      color: Colors.grey,
                                      size: 32,
                                    ),
                                    5.widthBox,
                                    Text(
                                      "Upload",
                                      style: textStyle(
                                          20, Colors.black, FontWeight.w600),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.deepOrangeAccent),
                    height: 50,
                    width: 50,
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 44,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
