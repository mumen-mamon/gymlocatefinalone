// ignore_for_file: camel_case_types, unused_local_variable, prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, avoid_unnecessary_containers

import 'dart:math';

import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_week_view/flutter_week_view.dart';
import 'package:gym1/screens/date/widgets/DynamicDayView.dart';


import '../../utils/color_manager.dart';
import '../../widgets/cards/custom_container_icon.dart';
import '../../widgets/texts/custom_text.dart';

class Date_Screen extends StatefulWidget {
  const Date_Screen({super.key});

  @override
  State<Date_Screen> createState() => _Date_ScreenState();
}

class _Date_ScreenState extends State<Date_Screen> {
  /// The added events.
  List<FlutterWeekViewEvent> events = [];

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();

    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text('', style: TextStyle(color: ColorManager.Primer))),
        backgroundColor: Colors.grey[200],
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                DateTime start = DateTime(now.year, now.month, now.day, Random().nextInt(24), Random().nextInt(60));
                events.add(FlutterWeekViewEvent(
                  title: 'Event ${events.length + 1}',
                  start: start,
                  end: start.add(const Duration(hours: 1)),
                  description: 'A description.',
                ));
              });
            },
            icon: const Icon(Icons.add, color: ColorManager.Primer),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Custom_Text(text: 'Good Morning,', size: 30),
                SizedBox(height: 10),
                DatePicker(
                  DateTime.now(),
                  initialSelectedDate: DateTime.now(),
                  selectionColor: ColorManager.backg,
                  selectedTextColor: ColorManager.b,
                  onDateChange: (date) {
                    // New date selected
                    setState(() {
                      // _selectedValue = date;
                    });
                  },
                ),

                //

                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Custom_Text(text: 'Schedule Today', size: 30),
                ),

                DynamicDayView(),

                SizedBox(height: 10),
                Custom_Text(text: 'Reminder', size: 30),
                SizedBox(height: 10),
                Custom_Text(text: 'Dont Forget Schedule for Tomorrow', size: 15, color: ColorManager.g),
                SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  height: 85,
                  decoration: BoxDecoration(
                    color: ColorManager.backg,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 30),
                        child: Custom_Container_Icon(h: 60, w: 60),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.access_time_outlined,
                                size: 20,
                              ),
                            ),
                            Custom_Text(text: '12.00 - 16.00', size: 15, color: ColorManager.g),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
