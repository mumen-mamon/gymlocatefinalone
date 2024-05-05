// ignore_for_file: non_constant_identifier_names, unused_local_variable

import 'package:flutter/material.dart';

Container Img_Assets({required context, img, required double h, required double w}) {
  Size size = MediaQuery.of(context).size;

  return Container(
    height: h,
    width: w,
    decoration: const BoxDecoration(
        // borderRadius: BorderRadius.circular(10),
        // border: Border.all(width: 1, color: Colors.blue),
        ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Image.asset(
        img,
        // height:1 ,
        // width:100,
        fit: BoxFit.fill,
      ),
    ),
  );
}
