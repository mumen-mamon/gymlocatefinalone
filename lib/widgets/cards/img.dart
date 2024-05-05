// ignore_for_file: non_constant_identifier_names, unused_local_variable

import 'package:flutter/material.dart';

Container Custom_Container_img({required context, img, required double h, required double w, double? circular}) {
  Size size = MediaQuery.of(context).size;

  return Container(
    height: h,
    width: w,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(50),

      // border: Border.all(width: 1, color: Colors.blue),
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(circular ?? 30),
      child: Image.network(
        img,
        // height:1 ,
        // width:100,
        fit: BoxFit.fill,
      ),
    ),
  );
}
