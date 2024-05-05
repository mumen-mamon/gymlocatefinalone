// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

import '../../utils/color_manager.dart';

Widget Custom_Container_Icon({double? h, double? w}) {
  return Container(
    width: w ?? 50,
    height: h ?? 50,
    decoration: BoxDecoration(
      color: ColorManager.Light_green,
      borderRadius: BorderRadius.circular(12),
    ),
    child: const Center(
      child: Icon(Icons.date_range, size: 35),
    ),
  );
}
