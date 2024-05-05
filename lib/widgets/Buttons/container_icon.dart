// ignore_for_file: non_constant_identifier_names, avoid_unnecessary_containers

import 'package:flutter/material.dart';

Widget Button_Icon({
  required double h,
  required double w,
  Color? color_Text,
  double? size_Text,
  String? text,
  double? size_icon,
  Color? color_border,
  Color? background,
  Color? color_icon,
  Color? color_overlayColor,
  IconData? icon,
  double? circular,
  double? W_SizedBox,
  Function()? onPressed,
}) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(circular ?? 10),
      ),
    ).copyWith(
      overlayColor: MaterialStatePropertyAll(color_overlayColor ?? Colors.blue),
      side: MaterialStatePropertyAll(
        BorderSide(color: color_border ?? Colors.blue, width: 1.3),
      ),
      backgroundColor: MaterialStateProperty.resolveWith((states) {
        return background ?? Colors.white;
      }),
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            icon,
            color: color_icon ?? Colors.cyan,
            size: size_icon ?? 32,
          )
        ],
      ),
    ),
  );
}
