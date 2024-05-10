import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/gym_name/model.dart';
import '../screens/trainer/trainer_screen.dart';
import '../utils/color_manager.dart';
import '../utils/navigators.dart';
import '../widgets/Buttons/scale_button.dart';
import '../widgets/appBar/custom_appBar.dart';
import '../widgets/cards/img.dart';
import '../widgets/slider/custom_slider.dart';
import '../widgets/texts/custom_text.dart';

class Goldgym extends StatefulWidget {
  const Goldgym({Key? key}) : super(key: key);

  @override
  State<Goldgym> createState() => _GoldgymState();
}

class _GoldgymState extends State<Goldgym> {
  final img = [
    'https://i0.wp.com/ace-jordan.com/wp-content/uploads/2023/01/Golds_Gym_Rajamundry.jpeg?resize=768%2C640&ssl=1',
    'https://cdn.gulte.com/wp-content/uploads/2020/05/Golds-Gym-Bankruptcy.jpg',
    'https://i0.wp.com/ace-jordan.com/wp-content/uploads/2023/01/GoldsJordan-770-1_0.jpeg?resize=768%2C506&ssl=1',
    'https://images.squarespace-cdn.com/content/v1/5bb93c3f90f90476ce350a31/345f6a0c-2069-4a96-b5d5-0cb53675fcdc/Gold+gym+Japan.jpg?format=1000w',
    'https://dubaigymfluencers-1eff6.kxcdn.com/wp-content/uploads/2023/05/Screenshot-2023-05-15-at-14.37.05-1024x564.png.webp',
    'https://classpass-res.cloudinary.com/image/upload/f_auto/q_auto/xxjwa6xyzl3wx97hsiy0.jpg'
  ];

  final List<String> coachNames = ['mustafa', 'Diya', 'ibrahim']; // Example coach names

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: Custom_AppBar(''),
      body: Padding(
        padding: EdgeInsets.all(10),
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
                      child: Custom_Text(text: 'gold gym', size: 25, color: Colors.white),
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
                            Custom_Text(text: 'About The Gym ', size: 15, underline: true),
                            Custom_Scale_Button(Color.fromARGB(255, 108, 186, 231), Colors.black, 20, const Icon(Icons.phone), () {}),
                            Text("06 400 1222")
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 30, right: 30),
                        child: Custom_Text(
                            text:
                            'Golds Gym International, Inc. is an American chain of international co-ed fitness centers (commonly referred to as gyms) originally started by Joe Gold in Venice Beach, California. Each gym offers a variety of cardio and strength training equipment as well as group exercise programs',
                            size: 22,
                            underline: false,
                            color: ColorManager.Light_green),
                      ),
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
                                          img: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcShrl-ZYxuud2KegulHKRKecy11bEbkSYq6bsh3XE6WrA&s',
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
                                          img: 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Instagram_icon.png/600px-Instagram_icon.png',
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
                      Container(
                        height: 200,
                        width: double.infinity,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
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
                                            decoration: BoxDecoration(border: Border.all(width: 2), borderRadius: BorderRadius.circular(50)),
                                            child: Custom_Container_img(
                                              context: context,
                                              h: 100,
                                              w: 100,
                                              circular: 50,
                                              img: 'https://www.crushpixel.com/big-static15/preview4/muscular-man-practicing-with-dumbbells-1981783.jpg',
                                            ),
                                          ),
                                          Text(
                                            coachNames[index], // Use coach names dynamically
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 19,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Lemonada',
                                              decoration: TextDecoration.underline,
                                            ),
                                          ),
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
