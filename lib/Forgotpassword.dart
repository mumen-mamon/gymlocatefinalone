import 'package:flutter/material.dart';

import 'SigninPage.dart';

void main() {
  runApp(const ForgotPasswordPage());
}

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  late TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFFEEF0E5),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(45),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/gymlocate.jpg",
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                    ],
                  ),
                ],
              ),
            ),
            const Text(
              "Forgot   Password",
              style: TextStyle(
                  color: Color(0xFF1e3727),
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  fontStyle: FontStyle.italic),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 100),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: _emailController,
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                  hintText: "Email",
                  hintStyle: TextStyle(color: Color(0xFFbab9b6)),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.only(bottom: 100, top: 35),
              child: MaterialButton(
                minWidth: 350,
                height: 50,
                color: const Color(0xFF496248),
                textColor: Colors.white,
                onPressed: () {
                  // Add your logic here for sending code
                },
                child: const Text("Send Code"),
              ),
            ),
            SizedBox(height: 50,)
           ,
            TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context)=> SigninPage(),
                ),
                );
              },
              child: Text(
                'skip now',
                style: TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
