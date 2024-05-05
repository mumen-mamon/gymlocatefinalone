import 'package:flutter/material.dart';


import 'HomePage.dart';
import 'SigninPage.dart';
import 'SignupPage.dart';



class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/Amman.jpg",
              fit: BoxFit.cover, // Adjust fit as needed
            ),
          ),
          Center(
            child: Column(
              children: [
                Container(
                  height: 450,
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
                          builder: (context) => SignupPage(),
                        ),
                      );
                    },
                    child: const Text('Sign Up '),
                  ),
                ),
                Container(
                  height: 20,
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
                          builder: (context) => SigninPage(),
                        ),
                      );
                    },
                    child: const Text('Sign in '),
                  ),
                ),
                Container(
                  height: 120,
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  height: 50,
                  width: 100,
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
                          builder: (context) => HomePage(),
                        ),
                      );
                    },
                    child: const Text('As a guest'),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
