// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loadingindicator extends StatelessWidget {
  Color color;
  Loadingindicator({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitWave(
        color: color, // Customize the color
        size: 50.0, // Adjust the size
      ),
    );
  }
}

class CircularLoading extends StatelessWidget {
  Color color;
  CircularLoading({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: color,
      ),
    );
  }
}
