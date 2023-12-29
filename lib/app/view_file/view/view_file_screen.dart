import 'package:flutter/material.dart';
import 'package:sdrive/app/file/model/file_model.dart';
import 'package:sdrive/general/utils/color.dart';
import 'package:sdrive/general/utils/fonts_style.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../file/services/firebase_services.dart';
import '../widget/audio_player.dart';
import '../widget/show_file.dart';
import '../widget/show_image.dart';
import '../widget/video_player.dart';

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
                      height: 200,
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
                            onTap: () async {
                              FirebaseService().downloadfile(file);
                              // ignore: use_build_context_synchronously
                              VxToast.show(context, msg: "download complete");
                            },
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
                            onTap: () async {
                              await FirebaseService().deleteFile(file);
                              // ignore: use_build_context_synchronously
                              VxToast.show(context, msg: "Remove completely");
                            },
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
              : file.fileType == "video"
                  ? VideoPlayerWidget(
                      url: file.url,
                    )
                  : file.fileType == "audio"
                      ? AudioPlayerWidget(url: file.url)
                      : Container(),
    );
  }
}
