import 'package:flutter/material.dart';
import 'package:sdrive/app/file/model/file_model.dart';
import 'package:sdrive/general/utils/color.dart';
import 'package:sdrive/general/utils/fonts_style.dart';
import '../widget/show_file.dart';
import '../widget/show_image.dart';

// ignore: must_be_immutable
class ViewFileScreen extends StatelessWidget {
  FileModel file;
  ViewFileScreen({super.key, required this.file});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(45),
        child: AppBar(
          title: Text(
            file.name,
            style: textStyle(18, textColor, FontWeight.w600),
          ),
          actions: [
            IconButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(8),
                    ),
                  ),
                  builder: (context) {
                    return SizedBox(
                      height: 180,
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                file.name,
                                style: textStyle(
                                    16, Colors.black, FontWeight.w500),
                              ),
                            ),
                          ),
                          const Divider(
                            color: Colors.grey,
                            height: 3,
                          ),
                          ListTile(
                            leading: const Icon(
                              Icons.file_download,
                              color: Colors.grey,
                            ),
                            title: Text(
                              "Download",
                              style:
                                  textStyle(16, Colors.black, FontWeight.w500),
                            ),
                          ),
                          ListTile(
                            leading: const Icon(
                              Icons.delete,
                              color: Colors.grey,
                            ),
                            title: Text(
                              "Remove",
                              style:
                                  textStyle(16, Colors.black, FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              icon: const Icon(Icons.more_vert),
            )
          ],
        ),
      ),
      body: file.fileType == "image"
          ? showImage(file.url)
          : file.fileType == "application"
              ? showFile(file, context)
              : Container(),
    );
  }
}
