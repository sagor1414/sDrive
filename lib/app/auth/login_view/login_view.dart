import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../general/utils/color.dart';
import '../../../general/utils/fonts_style.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomLeft,
            colors: [Colors.deepPurpleAccent, Colors.purpleAccent]),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                width: context.screenWidth,
                margin: const EdgeInsets.only(left: 30, right: 30, bottom: 35),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(color: Colors.white, spreadRadius: 5),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    20.heightBox,
                    Image.asset(
                      'assets/images/files.png',
                      width: 200,
                    ),
                    Text(
                      "Simplify your",
                      style: textStyle(
                          25, const Color(0xff635C9B), FontWeight.w700),
                    ),
                    Text(
                      "filing system",
                      style: textStyle(
                          25, const Color(0xff635C9B), FontWeight.w700),
                    ),
                    10.heightBox,
                    Text(
                      "Keep your files",
                      style: textStyle(20, textColor, FontWeight.w600),
                    ),
                    Text(
                      "organized mode easily",
                      style: textStyle(20, textColor, FontWeight.w600),
                    ),
                    20.heightBox,
                    Container(
                      width: context.screenWidth / 1.7,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.deepOrangeAccent.withOpacity(0.8),
                      ),
                      child: Center(
                        child: Text(
                          "Let's go",
                          style: textStyle(23, Colors.white, FontWeight.w700),
                        ),
                      ),
                    ),
                    20.heightBox,
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
