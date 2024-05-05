// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

Widget Text_Button({text, size, text_Color, icon, onPressed}) {
  return Row(
    children: [
      icon != null ? Icon(icon ?? Icons.home) : const SizedBox(),
      TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          foregroundColor: text_Color ?? Colors.black,
          // elevation: 2,
          // backgroundColor: Colors.amber,
        ),
        child: Text(
          '$text',
          style: TextStyle(
            fontSize: size ?? 15,
            fontWeight: FontWeight.bold,
            fontFamily: 'Lemonada',
          ),
        ),
      ),
    ],
  );
}
