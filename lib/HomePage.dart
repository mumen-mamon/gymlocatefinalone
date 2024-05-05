import 'package:flutter/material.dart';
import 'package:gym1/screens/Home/home.dart';
import 'package:gym1/screens/date/date.dart';
import 'package:gym1/screens/graphic/graphic.dart';
import 'package:gym1/screens/location/test.dart';

import 'package:gym1/utils/color_manager.dart';
import 'package:motion_tab_bar/MotionTabBar.dart';
import 'package:motion_tab_bar/MotionTabBarController.dart';
import 'screens/profile/screens/profile_page.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MyAppState();
}

class _MyAppState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      home: My_TabBar(),
    );
  }
}

class My_TabBar extends StatefulWidget {
  const My_TabBar({super.key});

  @override
  My_TabBarState createState() => My_TabBarState();
}

class My_TabBarState extends State<My_TabBar> with TickerProviderStateMixin {
  MotionTabBarController? _motionTabBarController;

  @override
  void initState() {
    ints(context);
    super.initState();
  }

  ints(context) async {
    _motionTabBarController = MotionTabBarController(initialIndex: 2, length: 4, vsync: this);
    await Future.delayed(const Duration(seconds: 0), () async {
      _motionTabBarController!.index = 2;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _motionTabBarController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // final crl = Provider.of<Cart_Controller>(context, listen: false);

    return Scaffold(
      bottomNavigationBar: MotionTabBar(
        controller: _motionTabBarController,
        useSafeArea: true,
        initialSelectedTab: "Home",
        labels: const ["Home", "Great Job", "Location", "Profile",],
        icons: const [Icons.home, Icons.work, Icons.location_on, Icons.person,],
        badges: const [
          null,
          // MotionBadgeWidget(
          //   text: '${1}',
          //   textColor: Colors.white,
          //   color: Colors.red,
          //   size: 20,
          // ),
          null,
          null,
          null,
        ],
        tabSize: 50,
        tabBarHeight: 60,
        textStyle: const TextStyle(fontSize: 12, color: ColorManager.w, fontWeight: FontWeight.w500),
        tabIconColor: ColorManager.w,
        tabIconSize: 28.0,
        tabIconSelectedSize: 26.0,
        tabSelectedColor: ColorManager.w,
        tabIconSelectedColor: ColorManager.Primer,
        tabBarColor: ColorManager.Primer,
        onTabItemSelected: (int value) {
          setState(() {
            _motionTabBarController!.index = value;
          });
        },
      ),
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _motionTabBarController,
        children: [
          Home_Screen(),
          Graphic_Screen(),
          Location(),
          ProfilePage(),
         // Date_Screen()
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
