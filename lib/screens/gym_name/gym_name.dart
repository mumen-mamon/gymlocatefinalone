// ignore_for_file: camel_case_types, unused_local_variable, prefer_const_constructors, sized_box_for_whitespace
import 'package:flutter/material.dart';

import '../../utils/color_manager.dart';
import '../../utils/navigators.dart';
import '../../widgets/Buttons/scale_button.dart';
import '../../widgets/appBar/custom_appBar.dart';
import '../../widgets/cards/img.dart';
import '../../widgets/slider/custom_slider.dart';
import '../../widgets/texts/custom_text.dart';
import '../trainer/trainer_screen.dart';
import 'model.dart';

class Gym_Name extends StatefulWidget {
  const Gym_Name({super.key});

  @override
  State<Gym_Name> createState() => _Gym_NameState();
}

class _Gym_NameState extends State<Gym_Name> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final img = [
      'https://lh3.googleusercontent.com/p/AF1QipM0ozEXqnLMd78G42e56LO5Nql8PG0DLD3LMngg=s1600-w720',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTgA1O_20MeY07WA1dfFULIkSxw3fOI2fEtHg3cAGBLog&s',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTrdYghLnZRM8ls7R6H2NG7-QJS3GoJoDjgVnuamwzJaIBWNYeHyBIwK9U0ZK6X2zyvY18&usqp=CAU',
    ];
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
                    left: 10,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 40, bottom: 10),
                      child: Custom_Text(text: 'Gym Name', size: 25, color: Colors.white),
                    ),
                  ),
                  Positioned(
                    bottom: 25,
                    right: 20,
                    child: Custom_Scale_Button(ColorManager.w, Colors.black, 20, const Icon(Icons.favorite), () {}),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Card(
                color: Color.fromARGB(199, 148, 182, 151),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                child: Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 20, left: 10, right: 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Custom_Text(text: 'About The Gym ', size: 25, underline: true),
                            Custom_Scale_Button(Color.fromARGB(255, 108, 186, 231), Colors.black, 20, const Icon(Icons.phone), () {}),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 30, right: 30),
                        child: Custom_Text(
                            text:
                                'Stamina Gym Fitness Center provides proper training and conditioning for members who want to improve and transform their body with Program depend on the body composition.',
                            size: 22,
                            underline: false,
                            color: ColorManager.Light_green),
                      ),

                      // ===========
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Custom_Container_img(
                              context: context,
                              h: 350,
                              w: size.width / 1.9,
                              img: 'https://www.google.com/maps/d/thumbnail?mid=15QJ_qiK10k15gPLe0NW-R7Zpm40&hl=en_US'),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Custom_Text(text: 'Visit Our Gym', size: 15, underline: true),
                                Padding(
                                  padding: const EdgeInsets.only(top: 30, bottom: 50),
                                  child: Custom_Text(text: 'Address:', size: 20, underline: false, color: ColorManager.Light_green),
                                ),
                                Custom_Text(text: 'Our Socials:', size: 20, underline: false, color: ColorManager.Light_green),
                                Padding(
                                  padding: const EdgeInsets.only(top: 18),
                                  child: Row(
                                    children: [
                                      InkWell(
                                        onTap: () {},
                                        child: Custom_Container_img(
                                          context: context,
                                          h: 35,
                                          w: 35,
                                          circular: 50,
                                          img:
                                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcShrl-ZYxuud2KegulHKRKecy11bEbkSYq6bsh3XE6WrA&s',
                                        ),
                                      ),
                                      const SizedBox(width: 20),
                                      InkWell(
                                        onTap: () {},
                                        child: Custom_Container_img(
                                          context: context,
                                          h: 35,
                                          w: 35,
                                          circular: 50,
                                          img:
                                              'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Instagram_icon.png/600px-Instagram_icon.png',
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 30, bottom: 15),
                        child: Custom_Text(text: 'Coaches', size: 25, underline: true),
                      ),

                      // =======================

                      Container(
                        height: 200,
                        width: double.infinity,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          // itemExtent: 140,
                          itemCount: 3,
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              onTap: () {
                                pushNewScreen(context, Trainer_Screen());
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(6),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 190,
                                      width: 130,
                                      decoration: BoxDecoration(color: Colors.grey[350], borderRadius: BorderRadius.circular(30)),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Container(
                                            decoration:
                                                BoxDecoration(border: Border.all(width: 2), borderRadius: BorderRadius.circular(50)),
                                            child: Custom_Container_img(
                                              context: context,
                                              h: 100,
                                              w: 100,
                                              circular: 50,
                                              img:
                                                  'https://www.crushpixel.com/big-static15/preview4/muscular-man-practicing-with-dumbbells-1981783.jpg',
                                            ),
                                          ),
                                          Custom_Text(text: 'Coach John', size: 20, underline: true),
                                          const SizedBox(height: 10),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),

                      // =================================

                      Padding(
                        padding: const EdgeInsets.only(top: 30, bottom: 15),
                        child: Custom_Text(text: 'Join Our Membership', size: 25, underline: false),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(bottom: 30, right: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Custom_Text(text: 'Our Plan:', size: 25, underline: true),
                            const SizedBox(height: 10),
                            GridView.count(
                              // childAspectRatio: (itemWidth / itemHeight),
                              shrinkWrap: true,
                              padding: EdgeInsets.only(left: 15, right: 15),
                              mainAxisSpacing: 15,
                              crossAxisSpacing: 10,
                              crossAxisCount: 2,
                              physics: NeverScrollableScrollPhysics(),
                              children: Our_Plan,
                            ),
                          ],
                        ),
                      ),
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
