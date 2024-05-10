// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:scale_button/scale_button.dart';

Widget Custom_Scale_Button(background_Color, icon_color, double? size, icon, onPressed) {
  return ScaleButton(
    reverse: false,
    child: CircleAvatar(
      backgroundColor: background_Color ?? Colors.grey[300],
      radius: size ?? 15.0,
      child: IconButton(
        padding: EdgeInsets.zero,
        icon: icon ?? const Icon(Icons.add),
        color: icon_color ?? Colors.black,

        onPressed: onPressed,
      ),


    ),
  );
}
