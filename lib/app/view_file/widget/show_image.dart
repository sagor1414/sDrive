import 'package:flutter/material.dart';

showImage(String url) {
  return Center(
    child: Image(image: NetworkImage(url)),
  );
}
