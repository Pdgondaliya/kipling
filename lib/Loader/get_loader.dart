import 'package:flutter/material.dart';

import 'color_loader_3.dart';

Widget centerProgressBar({required double radius, required double dotRadius}) {
  return Center(
      child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      ColorLoader3(
        dotRadius: dotRadius,
        radius: radius,
      )
    ],
  ));
}
