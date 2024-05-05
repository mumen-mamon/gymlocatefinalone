// ignore_for_file: non_constant_identifier_names, prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_types_as_parameter_names, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:app_bar_with_search_switch/app_bar_with_search_switch.dart';
import 'package:flutter/material.dart';

import '../texts/custom_text.dart';
import '../../utils/color_manager.dart';

Custom_AppBar(text) {
  return AppBarWithSearchSwitch(
    onChanged: (text) {},
    animation: AppBarAnimationSlideLeft.call,
    appBarBuilder: (context) {
      return AppBar(
        iconTheme: IconThemeData(size: 26.5),
        // toolbarHeight: 80,
        backgroundColor: Colors.grey[200],

        title: Center(
          child: Custom_Text(text: text, size: 20, color: ColorManager.Primer),
        ),
        leading: AppBarSearchButton(),
      );
    },
  );
}
