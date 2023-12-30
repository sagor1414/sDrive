import 'package:flutter/material.dart';
import 'package:sdrive/app/widgets/upload_option.dart';
import 'package:velocity_x/velocity_x.dart';

import 'strrage_containner.dart';

class StorageScreen extends StatelessWidget {
  const StorageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          40.heightBox,
          const StorageContainer(),
          45.heightBox,
          const UploadOptions(),
        ],
      ),
    );
  }
}
