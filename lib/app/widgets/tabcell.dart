import 'package:flutter/material.dart';
import 'package:sdrive/general/utils/color.dart';
import 'package:sdrive/general/utils/fonts_style.dart';

Widget tabcell(String text, bool selected, BuildContext context) {
  return selected
      ? Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.40,
            height: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.deepOrangeAccent,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    offset: const Offset(10, 10),
                    blurRadius: 10,
                  ),
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    offset: const Offset(-10, 10),
                    blurRadius: 10,
                  ),
                ]),
            child: Center(
                child: Text(
              text,
              style: textStyle(23, Colors.white, FontWeight.bold),
            )),
          ),
        )
      : SizedBox(
          width: MediaQuery.of(context).size.width * 0.40,
          height: 60,
          child: Center(
              child: Text(
            text,
            style: textStyle(23, textColor, FontWeight.bold),
          )),
        );
}
