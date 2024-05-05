// ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace

import 'package:flutter/material.dart';
import '../texts/custom_text.dart';

Widget custom_Card(
    {required double h, required double w, text, double? circular, color, fontweight, required double size, color_text}) {
  return Container(
    width: w,
    height: h,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(circular ?? 12),
      border: Border.all(
        color: const Color.fromARGB(255, 28, 66, 29),
      ),
    ),
    child: Center(
      child: Custom_Text(text: text, size: size, fontweight: fontweight ?? FontWeight.normal, color: color_text),
    ),
  );
}
