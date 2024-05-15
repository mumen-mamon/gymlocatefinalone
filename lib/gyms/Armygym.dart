import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../screens/gym_name/model.dart';
import '../screens/trainer/trainer_screen.dart';
import '../utils/color_manager.dart';
import '../utils/navigators.dart';
import '../widgets/Buttons/scale_button.dart';
import '../widgets/appBar/custom_appBar.dart';
import '../widgets/cards/img.dart';
import '../widgets/slider/custom_slider.dart';
import '../widgets/texts/custom_text.dart';

class Armygym extends StatefulWidget {
  const Armygym({Key? key}) : super(key: key);

  @override
  State<Armygym> createState() => _ArmygymState();
}

class _ArmygymState extends State<Armygym> {
  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(31.990195766401396, 35.95649370473624),
    zoom: 14.4746,
  );
  final img = [
    'https://abood.acccnetwork.com/wp-content/uploads/2020/09/124-400x230.jpg',
    'https://mcidecor.com/data/73/30118/16298030053919.jpg',
    'https://mcidecor.com/data/73/30118/1629803006707.jpg',
    'https://mcidecor.com/data/73/30118/1629803006779.jpg',
    'https://s.yimg.com/ny/api/res/1.2/gh56LtWnDbJlgDBt43n.ng--/YXBwaWQ9aGlnaGxhbmRlcjt3PTk2MDtoPTY1MztjZj13ZWJw/https://media.zenfs.com/en/reuters.com/a878abc661ff8c0901912361c8ec7461',

  ];

  final List<String> coachNames = ['bedawi', 'ezzaldeen', 'naseer']; // Example coach names

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
                      child: Custom_Text(text: 'Army gym', size: 25, color: Colors.white),
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
                            Text("0790081545")
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 30, right: 30),
                        child: Custom_Text(
                            text:
                            'ARMY GYM Endurance Power Qualified trainers Advanced equipment Cardio/Aerobics classes',
                            size: 22,
                            underline: false,
                            color: ColorManager.Light_green),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [ SizedBox(height: 200,),
                          GoogleMap(
                            mapType: MapType.normal,
                            initialCameraPosition: _kGooglePlex,
                            onMapCreated: (GoogleMapController controller) {
                              _controller.complete(controller);
                            },
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
                                  child: Row(
                                    children: [
                                      InkWell(
                                        onTap: () {},
                                        child: Text("facebook: ARMY GYM",
                                        ),
                                      ),
                                      const SizedBox(width: 20),
                                      InkWell(
                                        onTap: () {},
                                        child: Text("inestagram: ARMY GYM ",
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
