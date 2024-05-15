import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:gym1/register.dart';

import '../screens/gym_name/model.dart';
import '../screens/trainer/trainer_screen.dart';
import '../utils/color_manager.dart';
import '../utils/navigators.dart';
import '../widgets/Buttons/scale_button.dart';
import '../widgets/appBar/custom_appBar.dart';
import '../widgets/cards/custom_card.dart';
import '../widgets/cards/img.dart';
import '../widgets/slider/custom_slider.dart';
import '../widgets/texts/custom_text.dart';

class Vegagym extends StatefulWidget {
  const Vegagym({Key? key}) : super(key: key);

  @override
  State<Vegagym> createState() => _VegagymState();
}

class _VegagymState extends State<Vegagym> {
  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(31.998884835963644, 35.83999821469937),
    zoom: 14.4746,
  );
  final img = [
    'https://i0.wp.com/livinginjordanasexpat.com/wp-content/uploads/2020/01/img_20191022_084419.jpg?w=521&h=261&ssl=1',
    'https://i0.wp.com/livinginjordanasexpat.com/wp-content/uploads/2020/01/img_20191029_133036.jpg?w=521&h=261&ssl=1',
    'https://i0.wp.com/livinginjordanasexpat.com/wp-content/uploads/2020/01/img_20191029_133059.jpg?w=259&h=129&ssl=1',
    'https://i0.wp.com/livinginjordanasexpat.com/wp-content/uploads/2019/12/img_20190909_065705-1.jpg?resize=2000%2C1200&ssl=1',
    'https://wathefty.com/jobs/wp-content/uploads/2022/11/%D9%81%D9%8A%D8%AC%D8%A7-%D8%AC%D9%8A%D9%85-e1669202881863-780x470.jpg',

  ];

  final List<String> coachNames = ['amani', 'ezzaldeen', 'naseer']; // Example coach names

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
                      child: Custom_Text(text: 'Vega gym', size: 25, color: Colors.white),
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
                            Text("07 9099 2033")
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 30, right: 30),
                        child: Custom_Text(
                            text:
                            'Vega Fitness operates 4 branches across Amman, and we are leading the fitness Industry in Jordan sin',
                            size: 22,
                            underline: false,
                            color: ColorManager.Light_green),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [SizedBox(height: 200,
                 child: GoogleMap(
                    mapType: MapType.normal,
                    initialCameraPosition: _kGooglePlex,
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                  ),
                        ),
                          Padding(
                            padding: const EdgeInsets.only(right: 100),
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
                                  child: Column(
                                    children: [
                                      InkWell(
                                        onTap: () {},
                                        child: Text("Facebook:  Vega Fitness khalda")
                                      ),
                                      const SizedBox(width: 20,height: 5,),
                                      InkWell(
                                        onTap: () {},
                                        child: Text("inestagram:  vega_Fitnessclubs")
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
                              children: Our__Plan,
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 45,
                              width: 250,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color(0xFFEEF0E5),
                              ),
                              child: MaterialButton(
                                height: 30,
                                minWidth: 20,
                                onPressed: () {
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (context) => Register(),
                                    ),
                                  );
                                },
                                child: const Text('register '),
                              ),
                            )
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
List<Widget> Our__Plan = [
  custom_Card(
    h: 50,
    w: 50,
    size: 20,
    text: '1 Month= 70jd',
    color: Colors.grey[350],
    fontweight: FontWeight.bold,
  ),
  custom_Card(
    h: 50,
    w: 50,
    size: 20,
    text: '3 month= 140jd',
    color: Colors.grey[350],
    fontweight: FontWeight.bold,
  ),
  custom_Card(
    h: 50,
    w: 50,
    size: 20,
    text: '6 month= 230jd',
    color: Colors.grey[350],
    fontweight: FontWeight.bold,
  ),
  custom_Card(
    h: 50,
    w: 50,
    size: 20,
    text: '1 year= 407jd',
    color: Colors.grey[350],
    fontweight: FontWeight.bold,
  ),
];
