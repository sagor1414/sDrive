import 'package:flutter/material.dart';
import 'package:sdrive/general/utils/color.dart';
import 'package:sdrive/general/utils/fonts_style.dart';

class FolderScetion extends StatelessWidget {
  const FolderScetion({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 6,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 20, mainAxisSpacing: 22),
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey.shade100,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.001),
                  offset: Offset(10, 10),
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
                "Photos",
                style: textStyle(18, textColor, FontWeight.bold),
              ),
              Text(
                "10 items",
                style: textStyle(14, Colors.grey[400]!, FontWeight.bold),
              ),
            ],
          ),
        );
      },
    );
  }
}
