import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'Forgotpassword.dart';
import 'HomePage.dart';


// Assuming homepage is defined in homepage.dart

class SigninPage extends StatefulWidget {
  const SigninPage({Key? key}) : super(key: key);

  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  bool isloading=false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEF0E5),
      body: isloading ? Center(child:CircularProgressIndicator()):
      Center(
        child: SingleChildScrollView(
          child: Center(
            child: SafeArea(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/logo.png"
                      ,alignment: Alignment.topCenter,
                    ),
                    const SizedBox(height: 100),
                    buildInputField("Email", email , validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    }
                     ),
                    const SizedBox(height: 20),
                     buildInputField("Password", password, isObscure: true,validator: (value) {
                       if (value == null || value.isEmpty) {
                         return 'Please enter your password';
                       }
                       return null;
                     }),
                       TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder:(context)=> ForgotPasswordPage(),
                       ),
                       );
                      },
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    )
                    ,
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: const Color(0xFF304D30)),
                      alignment: Alignment.center,
                      height: 40,
                      width: 200,
                      child: MaterialButton(
                          minWidth: 350,
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            try {
                             isloading=true;
                             setState(() {

                             });
                              final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                                email: email.text,
                                password: password.text,

                              );
                             isloading=false;
                             setState(() {

                             });

                              // Navigate to HomePage if authentication is successful
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => HomePage(),
                                ),
                              );
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'user-not-found') {
                                print('No user found for that email.');
                                AwesomeDialog(
                                    context: context,
                                    dialogType: DialogType.error,
                                    animType: AnimType.rightSlide,
                                    title: 'error',
                                    desc: 'No user found for that email.',
                                    btnCancelOnPress: () {},
                          btnOkOnPress: () {},
                          ).show();
                              } else if (e.code == 'wrong-password') {
                                print('Wrong password provided for that user.');
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.error,
                                  animType: AnimType.rightSlide,
                                  title: 'error',
                                  desc: 'Wrong password provided for that user',
                                  btnCancelOnPress: () {},
                                  btnOkOnPress: () {},
                                ).show();
                              }
                            }
                          }
                        },
                        child: Text('Sign In'),textColor: Colors.white,
                      ),




                      // child: Text(
                         //'sign in',
                      //  ),
                       // textColor: Colors.white,
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


Widget buildInputField(String labelText, TextEditingController controller,
    {bool isObscure = false, required String? Function(dynamic value) validator}) {
  {String? Function(String?)? validator;}
  var validator;
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




