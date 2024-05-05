import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gym1/Information.dart';

import 'HomePage.dart';


class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEF0E5),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/gymlocate.jpg",
                  alignment: Alignment.topCenter,
                ),
                const SizedBox(height: 80),
                Container(
                  alignment: Alignment.topCenter,
                  height: 50,
                  width: 250,
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                buildInputField("User Name", username, validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                }),
                const SizedBox(height: 8),
                buildInputField("Email", email, validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                }),
                const SizedBox(height: 8),
                buildInputField(
                    "Password", password, isObscure: true, validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                }),
                const SizedBox(height: 8),
                buildInputField("Confirm Password", confirmPassword,
                    isObscure: true, validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    }),
                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: const Color(0xFF304D30),
                  ),
                  alignment: Alignment.center,
                  height: 40,
                  width: 200,
                  child: MaterialButton(
                      minWidth: 350,
                    onPressed: () async {
                      try {
                        if (password.text != confirmPassword.text) {
                          throw "Passwords do not match";
                        }
                        final credential = await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                          email: email.text,
                          password: password.text,
                        );
                        // Navigate to Home page if registration is successful
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) =>Information(),
                          ),
                        );
                      } catch (e) {
                        print("Error during sign up: $e");
                        // Handle error messages or display them to the user
                        // Example: ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("$e")));
                      }
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildInputField(String labelText, TextEditingController controller,
      {bool isObscure = false, required String? Function(dynamic value) validator}) {
    {
      String? Function(String?)? validator;
    }
    var validator;
    {
      return Container(
        width: 340,
        alignment: Alignment.center,
        child: TextFormField(
          controller: controller,
          obscureText: isObscure,
          validator: validator,
          decoration: InputDecoration(
            labelText: labelText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            hintText: "Enter $labelText",
          ),
        ),
      );
    }
  }
}