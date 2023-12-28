import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sdrive/app/display_file/controller/display_file_controller.dart';
import 'package:sdrive/app/file/services/firebase_services.dart';
import 'package:sdrive/app/view_file/view/view_file_screen.dart';
import 'package:sdrive/general/utils/color.dart';
import 'package:sdrive/general/utils/fonts_style.dart';
import 'package:velocity_x/velocity_x.dart';

class DisplayFileScreen extends StatelessWidget {
  final String title;
  final String type;
  const DisplayFileScreen({super.key, required this.title, required this.type});

  @override
  Widget build(BuildContext context) {
    FileController fileController = Get.find<FileController>();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(48),
        child: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.arrow_back_ios_new_outlined,
              color: textColor,
            ),
          ),
          title: Text(
            title,
            style: textStyle(18, textColor, FontWeight.bold),
          ),
        ),
      ),
      floatingActionButton: InkWell(
        onTap: () => type == "folder"
            ? FirebaseService().uploadFile(context, title)
            : FirebaseService().uploadFile(context, ''),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.deepOrangeAccent,
          ),
          height: 50,
          width: 50,
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 44,
          ),
        ),
      ),
      body: Obx(
        () => GridView.builder(
            itemCount: fileController.files.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Get.to(
                      () => ViewFileScreen(file: fileController.files[index]));
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 0.8),
                    ),
                    width: context.screenWidth / 2,
                    child: Column(
                      children: [
                        fileController.files[index].fileType == "image"
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Image(
                                    image: NetworkImage(
                                        fileController.files[index].url),
                                    width: context.screenWidth / 2.5,
                                    height: 120,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              )
                            : SizedBox(
                                width: context.screenWidth / 2,
                                height: 110,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 5, left: 8, right: 8),
                                  child: Image(
                                    image: AssetImage(
                                        'assets/icons/${fileController.files[index].fileExtension}.png'),
                                    // width: context.screenWidth / 2,
                                    // height: 110,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                        10.heightBox,
                        Padding(
                          padding: const EdgeInsets.only(left: 4, top: 2),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: Text(
                                  fileController.files[index].name,
                                  style:
                                      textStyle(14, textColor, FontWeight.bold),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
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
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  fileController
                                                      .files[index].name,
                                                  style: textStyle(
                                                      16,
                                                      Colors.black,
                                                      FontWeight.w500),
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
                                                style: textStyle(
                                                    16,
                                                    Colors.black,
                                                    FontWeight.w500),
                                              ),
                                            ),
                                            ListTile(
                                              leading: const Icon(
                                                Icons.delete,
                                                color: Colors.grey,
                                              ),
                                              title: Text(
                                                "Remove",
                                                style: textStyle(
                                                    16,
                                                    Colors.black,
                                                    FontWeight.w500),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                                icon: const Icon(
                                  Icons.more_vert,
                                  color: Colors.black,
                                  size: 30,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
