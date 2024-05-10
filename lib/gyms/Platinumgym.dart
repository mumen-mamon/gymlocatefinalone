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

class Platinumgym extends StatefulWidget {
  const Platinumgym({Key? key}) : super(key: key);

  @override
  State<Platinumgym> createState() => _PlatinumgymState();
}

class _PlatinumgymState extends State<Platinumgym> {
  final img=[
    'https://scontent.famm6-1.fna.fbcdn.net/v/t39.30808-6/312311960_6022147087818155_488852122745679637_n.jpg?stp=dst-jpg_p206x206&_nc_cat=100&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeH3pzVZbyVBlXWcVWwDd_9orIaWZkY-oXKshpZmRj6hcuWlVtnmDBoamwXxOxWzLj_ISgXNcGYXEe_12m47kQYW&_nc_ohc=_pdg999cwRcQ7kNvgH50YGk&_nc_ht=scontent.famm6-1.fna&oh=00_AYAOvpVAx8TCPFS7rgLrSnJjPwl0AfHZOORnVmVgkLBKKA&oe=6644480B',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS0RIK-ARWHBZaFlGtRb7yFaOks7wFBei2TolNm3-4o4Hk0GkjBjGl2qzn1wNwEu8f-k_s&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQS1tPjnD7EiCJxuxBO6GuxHVL9JwFbWw_W4vIqoDAUMRr81mVs8yIkWDPrJPilnCyE2s0&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ2CKk28PPrTLkLEUpfdVfS87ltqXpAnAn3rcJvWpQ1Txo_WqzBp4NynX6GCnFshFdZquM&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQN7uWSdUYcasUn7yLlF93DvbNzxuDaIsHyRU696c7ognAwlsbXpNB3i0tXgsA20VlP4I4&usqp=CAU',
    'https://scontent.famm6-1.fna.fbcdn.net/v/t39.30808-6/422624650_792798069551386_776057862972432191_n.jpg?stp=c52.0.206.206a_dst-jpg_p206x206&_nc_cat=107&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeGbWVJ21mtk7PJOyWHVpxH62Y2YDf0d5QXZjZgN_R3lBfS5owypuQsJfw8gu-WVkN0SdDVSXYdezxerHjuOszhS&_nc_ohc=ZCZXXSm0Ol8Q7kNvgHdHqYt&_nc_ht=scontent.famm6-1.fna&oh=00_AYB6jF-BvfqPN4fMKLMA7zoMRWMplj49TV3k_VhJJhrgzw&oe=66443B76'
  ];

  final List<String> coachNames = ['aseel', 'Lina', 'ibrahim']; // Example coach names

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
                      child: Custom_Text(text: 'Platinum gym', size: 25, color: Colors.white),
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
                            Text("07 8548 9999")
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 30, right: 30),
                        child: Custom_Text(
                            text:
                            'Platinum Gym " bayed Group " The largest sports club in the north of the Hashemite Kingdom of Jordan "Irbid" ..For men and women .. In Irbid City Centre',
                            size: 22,
                            underline: false,
                            color: ColorManager.Light_green),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                         // Custom_Container_img(
                          //    context: context,
                           //   h: 350,
                            //  w: size.width / 1.9,
                           //   img: 'https://www.google.com/maps/d/thumbnail?mid=15QJ_qiK10k15gPLe0NW-R7Zpm40&hl=en_US'),
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
                                        child: Text("Vega Fitness khalda") ,
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
