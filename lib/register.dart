import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gym1/membershipdetails.dart';
import 'package:gym1/screens/Home/home.dart';

import 'HomePage.dart';

void main() {
  runApp(const Register());
}

class Register extends StatefulWidget {
  const Register({super.key});
  @override
  State<Register> createState() => _Register();
}

class _Register extends State<Register> {
  TextEditingController name = TextEditingController();
  TextEditingController registerDate = TextEditingController();
  TextEditingController coachName = TextEditingController();
  TextEditingController cach =TextEditingController();
  GlobalKey<FormState> formstateName = GlobalKey();
  GlobalKey<FormState> formstateDate = GlobalKey();
  GlobalKey<FormState> formstateCoach = GlobalKey();
  CollectionReference register = FirebaseFirestore.instance.collection('register');


  Future<void> addUser(String uid) {
    // Call the user's CollectionReference to add a new user with the UID
    return register
        .doc(uid) // Use the UID as the document ID
        .set({
      'name': name.text,
      'date': registerDate.text,
      'coachname' :coachName.text,

    })
        .then((value) => Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => MemberShipDetails(),
      ),
    ))
        .catchError((error) => print("Failed to add user: $error"));
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: const Color(0xFFEFF0E5),

            body: ListView(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 15),
                  alignment: Alignment.center,
                  child: const Text(
                    "Register Information",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  child: Form(
                      key: formstateName,
                      child: TextFormField(
                        controller: name,
                        maxLength: 15,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.black, width: 3),
                                borderRadius: BorderRadius.circular(35)),
                            labelText: " Name",
                            labelStyle: const TextStyle(color: Colors.black),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(
                                    color: Color(0xFF5f765e), width: 3))),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please Enter Your Name";
                          }
                        },
                      )),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  child: Form(
                      key: formstateDate,
                      child: TextFormField(
                        controller: registerDate,
                        maxLength: 15,
                        keyboardType: TextInputType.datetime,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.black, width: 3),
                                borderRadius: BorderRadius.circular(35)),
                            labelText: "Register Date",
                            labelStyle: const TextStyle(color: Colors.black),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(
                                    color: Color(0xFF5f765e), width: 3))),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please Enter Your Register Date";
                          }
                        },
                      )),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  child: Form(
                      key: formstateCoach,
                      child: TextFormField(
                        controller: coachName,
                        maxLength: 15,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.black, width: 3),
                                borderRadius: BorderRadius.circular(35)),
                            labelText: "Coach Name",
                            labelStyle: const TextStyle(color: Colors.black),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(
                                    color: Color(0xFF5f765e), width: 3))),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please Enter Your Coach Name";
                          }
                        },
                      )),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 20),
                  alignment: Alignment.center,
                  child: const Text(
                    "Payment Method",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          const Text(
                            "Cash",
                            style: TextStyle(fontSize: 18),
                          ),
                          IconButton(
                              onPressed: () {
                                CollectionReference register = FirebaseFirestore.instance.collection('register');


                                Future<void> addUser(String uid) {
                                  // Call the user's CollectionReference to add a new user with the UID
                                  return register
                                      .doc(uid) // Use the UID as the document ID
                                      .set({
                                       'cach': cach.text ,

                                  })
                                      .then((value) => Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (context) => MemberShipDetails(),
                                    ),
                                  ))
                                      .catchError((error) => print("Failed to add user: $error"));
                                }
                              },
                              icon: const Icon(Icons.attach_money,
                                  size: 35, color: Color(0xFF5f765e)))
                        ],
                      ),
                      Column(
                        children: [
                          const Text("Visa", style: TextStyle(fontSize: 18)),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.payment,
                                size: 35,
                                color: Color(0xFF5f765e),
                              ))
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  height: 40,
                  width: 10,
                  alignment: AlignmentDirectional.center,
                  child: MaterialButton(
                    minWidth: 350,
                    textColor: Colors.white,
                    color: const Color(0xFF5f765e),
                    onPressed: () {
                      if (formstateName.currentState!.validate() &&
                          formstateDate.currentState!.validate() &&
                          formstateCoach.currentState!.validate()) {
                        addUser(register.id);
                      }
                    },
                    child: const Text("Continue"),
                  ),
                )
              ],
            )));
  }
}
