// ignore_for_file: camel_case_types, unused_local_variable, prefer_const_constructors

import 'package:flutter/material.dart';

import '../../utils/color_manager.dart';
import '../../widgets/Buttons/scale_button.dart';
import '../../widgets/appBar/custom_appBar.dart';
import '../../widgets/cards/custom_card.dart';

import '../../widgets/slider/custom_slider.dart';

import '../../widgets/texts/custom_text.dart';

class Trainer_Screen extends StatefulWidget {
  const Trainer_Screen({super.key});

  @override
  State<Trainer_Screen> createState() => _Trainer_ScreenState();
}

final img = [
  'https://hips.hearstapps.com/hmg-prod/images/hlh060120bodyworkout001-1592501985.jpg?resize=980:*',
  'https://img.freepik.com/premium-photo/man-sportswear-exercising-with-dumbbells_13339-228967.jpg',
  'https://hips.hearstapps.com/hmg-prod/images/701/thumb-6kettlebellmovesthatkillfat-1501086687.png?crop=0.636xw:1xh;center,top&resize=360:*',
];

class _Trainer_ScreenState extends State<Trainer_Screen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: Custom_AppBar(''),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Custom_Slider(context, img),
                  Positioned(
                    bottom: 55,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 40, bottom: 10),
                      child: Custom_Text(text: 'Trainer Name', size: 25),
                    ),
                  ),
                  Positioned(
                    bottom: 25,
                    child: Custom_Text(text: '( Trainer Specialty )', size: 25),
                  ),
                  Positioned(
                    bottom: 25,
                    right: 20,
                    child: Custom_Scale_Button(
                        const Color.fromARGB(185, 201, 177, 149), Colors.black, 20, const Icon(Icons.favorite), () {}),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Card(
                color: Color.fromARGB(199, 148, 182, 151),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Custom_Text(text: 'About Me ', size: 25, underline: true),
                          Custom_Scale_Button(Color.fromARGB(255, 108, 186, 231), Colors.black, 20, const Icon(Icons.phone), () {}),
                        ],
                      ),
                      SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.only(top: 30, bottom: 15),
                        child: Custom_Text(text: 'Experience', size: 25, underline: true),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          custom_Card(h: 30, w: 80, color: ColorManager.b, color_text: ColorManager.w, text: 'High', size: 14),
                          custom_Card(h: 30, w: 80, color: ColorManager.w, color_text: ColorManager.b, text: 'Moderate', size: 14),
                          custom_Card(h: 30, w: 80, color: ColorManager.w, color_text: ColorManager.b, text: 'Low', size: 14),
                          SizedBox(width: 30),
                        ],
                      ),
                      // ===========
                      Padding(
                        padding: const EdgeInsets.only(top: 30, bottom: 15),
                        child: Custom_Text(text: 'Sessions', size: 25, underline: true),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          custom_Card(h: 30, w: 80, color: ColorManager.b, color_text: ColorManager.w, text: '', size: 14),
                          custom_Card(h: 30, w: 80, color: ColorManager.w, color_text: ColorManager.b, text: '', size: 14),
                          custom_Card(h: 30, w: 80, color: ColorManager.w, color_text: ColorManager.b, text: '', size: 14),
                         // custom_Card(h: 30, w: 80, color: ColorManager.b, color_text: ColorManager.w, text: '', size: 14),
                        ],
                      ),

                      // ===========
                      Padding(
                        padding: const EdgeInsets.only(top: 30, bottom: 15),
                        child: Custom_Text(text: 'Gyms', size: 25, underline: true),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          custom_Card(h: 30, w: 80, color: ColorManager.b, color_text: ColorManager.w, text: '', size: 14),
                          custom_Card(h: 30, w: 80, color: ColorManager.w, color_text: ColorManager.b, text: '', size: 14),
                          custom_Card(h: 30, w: 80, color: ColorManager.w, color_text: ColorManager.b, text: '', size: 14),
                        //  custom_Card(h: 30, w: 80, color: ColorManager.b, color_text: ColorManager.w, text: '', size: 14),
                        ],
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }
}
