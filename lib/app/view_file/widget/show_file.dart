import 'package:flutter/material.dart';
import 'package:sdrive/app/file/model/file_model.dart';
import 'package:sdrive/general/utils/fonts_style.dart';
import 'package:velocity_x/velocity_x.dart';

import 'pdf_viewer.dart';

showFile(FileModel file, context) {
  if (file.fileExtension == 'pdf') {
    return PdfViewer(
      file: file,
    );
  } else {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Unfortunately this file cannot be opened",
            style: textStyle(18, Colors.black, FontWeight.w700),
          ),
          20.heightBox,
          SizedBox(
            width: 200,
            height: 40,
            child: TextButton(
              onPressed: () {},
              style:
                  TextButton.styleFrom(backgroundColor: Colors.lightBlueAccent),
              child: Text(
                "Download",
                style: textStyle(17, Colors.black, FontWeight.w700),
              ),
            ),
          )
        ],
      ),
    );
  }
}
