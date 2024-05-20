import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../register.dart';
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

class Vfitgym extends StatefulWidget {
  const Vfitgym({Key? key}) : super(key: key);

  @override
  State<Vfitgym> createState() => _VfitgymState();
}

class _VfitgymState extends State<Vfitgym> {
  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(31.890405421443038, 35.84286370101152),
    zoom: 14.4746,
  );
  final img = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS45R1Bt8olkIx7Grov2_c9aDmTQ7Hqny6CmuuUiScP2Q&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTH3loqh5bTc9zCXn6JDxSTD5RicUFS6rQxO9bGNGFpH00MCpf4Qe2H4xUGQLqBozfo_6E&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR9lvfSWEiauWZO_7ZmJNSwgQb-AkhX9v2AesB7v0MlS7cXrvDKrGSA_HfNWuP70IpSKd8&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBUefbVSpNSqpAHizLiCSvRa2VP6YDJNr8_hL4Pw28Ug&s',
    'https://classpass-res.cloudinary.com/image/upload/f_auto/q_auto/mdlekq3kfelws0hdnapj.jpg',

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
                      child: Custom_Text(text: 'Vfit gym', size: 25, color: Colors.white),
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
                            Text("07 9884 9141")
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 30, right: 30),
                        child: Custom_Text(
                            text:
                            'V Fit Ladies gym Get in a perfect body shape with integrated gym'
                                'Swimming Area - Weights Area - Ca',
                            size: 22,
                            underline: false,
                            color: ColorManager.Light_green),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 200,
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

                                ),
                                Custom_Text(text: 'Our Socials:', size: 20, underline: false, color: ColorManager.Light_green),
                                Padding(
                                  padding: const EdgeInsets.only(top: 18),
                                  child: Column(
                                    children: [
                                      InkWell(
                                          onTap: () {},
                                          child: Text("Facebook: V Fit Ladies Gym")
                                      ),
                                      const SizedBox(width: 20,height: 5,),
                                      InkWell(
                                          onTap: () {},
                                          child: Text("inestagram:  vega Fitnessclubs")
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
                              padding: EdgeInsets.only(left: 5, right: 5),
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                              crossAxisCount: 2,
                              physics: NeverScrollableScrollPhysics(),
                              children: OurPlan,
                            ),
                            SizedBox(height: 20,),
                            Row(
                              children: [
                                SizedBox(width: 20,),
                                Container(
                                  alignment: Alignment.center,
                                  height: 45,
                                  width: 250,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.greenAccent,
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
                                ),
                              ],
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

  custom_Card({required int h, required int w, required int size, required String text, Color? color, required FontWeight fontweight}) {}
}

List<Widget> OurPlan = [
custom_Card(
h: 50,
w: 50,
size: 20,
text: '1 Month= 75jd',
color: Colors.grey[350],
fontweight: FontWeight.bold,
),
custom_Card(
h: 50,
w: 50,
size: 20,
text: '2 month= 110jd',
color: Colors.grey[350],
fontweight: FontWeight.bold,
),
custom_Card(
h: 50,
w: 50,
size: 20,
text: '3 month= 150jd',
color: Colors.grey[350],
fontweight: FontWeight.bold,
),
];