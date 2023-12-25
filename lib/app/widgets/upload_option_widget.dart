import 'package:flutter/material.dart';

Widget colorContainer(Color bgColor, Icon icon, String option, String title) {
  return Container(
    width: 50,
    height: 50,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: bgColor,
    ),
    child: Center(
      child: icon,
    ),
  );
}
