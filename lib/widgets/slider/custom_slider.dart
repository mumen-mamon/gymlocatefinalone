// ignore_for_file: camel_case_types, non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:flutter_custom_carousel_slider/flutter_custom_carousel_slider.dart';

Widget Custom_Slider(context, img) {
  List<CarouselItem> pages = List.generate(
      img.length,
          (index) => CarouselItem(
        image: NetworkImage(img[index], scale: 30),
        onImageTap: (num) {},
      )).toList();
  return CustomCarouselSlider(
    items: pages,
    height: MediaQuery.of(context).size.height / 1.9,
    width: MediaQuery.of(context).size.width * .97,
    subHeight: 50,
    autoplay: false,
    showText: false,
    showSubBackground: false,
    indicatorShape: BoxShape.rectangle,
    selectedDotColor: Colors.blue,
    unselectedDotColor: Colors.grey,
  );
}