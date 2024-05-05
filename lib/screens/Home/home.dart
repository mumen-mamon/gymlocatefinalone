// ignore_for_file: camel_case_types, use_key_in_widget_constructors, unused_local_variable, avoid_unnecessary_containers

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../utils/color_manager.dart';
import '../../utils/navigators.dart';
import '../../widgets/appBar/custom_appBar.dart';
import '../../widgets/cards/custom_card.dart';
import '../../widgets/texts/custom_text.dart';
import '../gym_name/gym_name.dart';
import 'model.dart';

class Home_Screen extends StatefulWidget {
  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  final CarouselController carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: Custom_AppBar(''),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //

            Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 30, left: 10),
              child: SizedBox(
                height: 60,
                width: size.width,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  // itemExtent: 140,
                  itemCount: items.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {},
                      child: Row(
                        children: [
                          custom_Card(h: 50, w: 130, color: ColorManager.backg, text: items[index], size: 14),
                          const SizedBox(width: 8),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),

            Custom_Text(text: 'Nearby Gyms', size: 30),

            const SizedBox(height: 25),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 3,
                shrinkWrap: true,
                children: List.generate(
                  images.length,
                  (index) {
                    return InkWell(
                      onTap: () {
                        pushNewScreen(context, const Gym_Name());
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(images[index]),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: const BorderRadius.all(Radius.circular(25)),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
