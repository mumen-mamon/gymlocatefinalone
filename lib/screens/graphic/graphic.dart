// ignore_for_file: camel_case_types, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gym1/screens/graphic/widget/custome_graphic.dart';


import '../../utils/color_manager.dart';
import '../../widgets/cards/image_assets.dart';
import '../../widgets/texts/custom_text.dart';

class Graphic_Screen extends StatefulWidget {
  const Graphic_Screen({super.key});

  @override
  State<Graphic_Screen> createState() => _Graphic_ScreenState();
}

class _Graphic_ScreenState extends State<Graphic_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backg,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 30),
              child: Custom_Text(text: 'Great Job !!', size: 40),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 40, left: 30),
              child: Custom_Text(text: 'Successfully Compleated Day 4 Training', size: 20, fontweight: FontWeight.normal),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: Custom_Text(text: 'You Performance', size: 20, fontweight: FontWeight.normal),
            ),
            SizedBox(
              width: 450,
              height: 270,
              child: MyWidget(),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Img_Assets(context: context, h: 30, w: 30, img: 'assets/speed.png'),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Custom_Text(text: 'Totale Calories Burnt', size: 16, fontweight: FontWeight.normal),
                    SizedBox(height: 20),
                    Custom_Text(text: '460 kcal', size: 21),
                  ],
                ),
                SizedBox(width: 20),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Img_Assets(context: context, h: 30, w: 30, img: 'assets/total.png'),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Custom_Text(text: 'Totale Duration', size: 16, fontweight: FontWeight.normal),
                    SizedBox(height: 20),
                    Custom_Text(text: '1:26 hours', size: 21),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
