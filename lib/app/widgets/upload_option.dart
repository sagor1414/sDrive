import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

import 'upload_option_widget.dart';

class UploadOptions extends StatelessWidget {
  const UploadOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        colorContainer(
            Colors.lightBlue.withOpacity(0.2),
            const Icon(
              Icons.image,
              color: Colors.cyan,
              size: 30,
            ),
            "image",
            "Images"),
        colorContainer(
            Colors.pink.withOpacity(0.2),
            Icon(
              Icons.play_arrow_rounded,
              color: Colors.pink.withOpacity(0.5),
              size: 42,
            ),
            "video",
            "Videos"),
        colorContainer(
            Colors.blue.withOpacity(0.3),
            Icon(
              EvaIcons.fileText,
              color: Colors.indigoAccent.withOpacity(0.5),
              size: 30,
            ),
            "application",
            "Documents"),
        colorContainer(
            Colors.purple.withOpacity(0.2),
            Icon(
              EvaIcons.music,
              color: Colors.pink.withOpacity(0.4),
              size: 30,
            ),
            "audio",
            "Audio"),
      ],
    );
  }
}
