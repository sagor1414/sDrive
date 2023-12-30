import 'package:flutter/material.dart';
import 'package:sdrive/general/utils/color.dart';
import 'package:sdrive/general/utils/fonts_style.dart';
import 'package:velocity_x/velocity_x.dart';

class StorageContainer extends StatelessWidget {
  const StorageContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.screenWidth,
      margin: const EdgeInsets.only(left: 15, right: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.shade100,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.001),
              offset: const Offset(10, 10),
              blurRadius: 10,
            ),
            BoxShadow(
              color: Colors.grey.withOpacity(0.001),
              offset: const Offset(-10, 10),
              blurRadius: 10,
            ),
          ]),
      child: Padding(
        padding: const EdgeInsets.only(top: 25, bottom: 35),
        child: Column(
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(color: Colors.grey.withOpacity(.8), blurRadius: 10)
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '56',
                        style: textStyle(
                            50, const Color(0xff635C9B), FontWeight.bold),
                      ),
                      Text(
                        '%',
                        style: textStyle(
                            17, const Color(0xff635C9B), FontWeight.bold),
                      ),
                    ],
                  ),
                  Text(
                    'Used',
                    style: textStyle(
                        20, textColor.withOpacity(0.7), FontWeight.bold),
                  )
                ],
              ),
            ),
            20.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Container(
                      width: 18,
                      height: 18,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.deepOrangeAccent),
                    ),
                    15.widthBox,
                    Column(
                      children: [
                        Text(
                          "Used",
                          style: textStyle(
                              18, textColor.withOpacity(0.7), FontWeight.w600),
                        ),
                        Text(
                          "11 GB",
                          style: textStyle(
                              20, const Color(0xff635C9B), FontWeight.w600),
                        )
                      ],
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: 18,
                      height: 18,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.grey.withOpacity(0.25)),
                    ),
                    15.widthBox,
                    Column(
                      children: [
                        Text(
                          "Free",
                          style: textStyle(
                              18, textColor.withOpacity(0.7), FontWeight.w600),
                        ),
                        Text(
                          "9 GB",
                          style: textStyle(
                              20, const Color(0xff635C9B), FontWeight.w600),
                        )
                      ],
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
