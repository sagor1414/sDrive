import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sdrive/app/file/controller/files_screen_controller.dart';
import 'package:sdrive/general/utils/color.dart';
import 'package:sdrive/general/utils/fonts_style.dart';
import 'package:velocity_x/velocity_x.dart';

class RecentFile extends StatelessWidget {
  const RecentFile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Recent Files",
            style: textStyle(20, textColor, FontWeight.bold),
          ),
        ),
        15.heightBox,
        GetX<FileScreenController>(builder: (FileScreenController controller) {
          return SizedBox(
            height: 150,
            child: ListView.builder(
                itemCount: controller.recentfilesList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Container(
                      height: 150,
                      width: 110,
                      // padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.grey.withOpacity(0.5)),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          controller.recentfilesList[index].fileType == "image"
                              ? ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(10.0),
                                    topRight: Radius.circular(10.0),
                                  ),
                                  child: Image.network(
                                    controller.recentfilesList[index].url,
                                    width: double.infinity,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : ClipRRect(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 8),
                                    child: Image(
                                      width: double.infinity,
                                      height: 100,
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          'assets/icons/${controller.recentfilesList[index].fileExtension}.png'),
                                    ),
                                  ),
                                ),
                          10.heightBox,
                          Padding(
                            padding: const EdgeInsets.only(left: 4),
                            child: Text(
                              controller.recentfilesList[index].name,
                              style:
                                  textStyle(13, Colors.black, FontWeight.w300),
                              overflow: TextOverflow.ellipsis,
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }),
          );
        })
      ],
    );
  }
}
