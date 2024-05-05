import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gym1/HomePage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  runApp(const Information());
}

class Information extends StatefulWidget {
  const Information({super.key});
  @override
  State<Information> createState() => _MyAppState();
}

class _MyAppState extends State<Information> {
  TextEditingController age = TextEditingController();
  TextEditingController weight = TextEditingController();
  TextEditingController height = TextEditingController();

  GlobalKey<FormState> formstateAge = GlobalKey();
  GlobalKey<FormState> formstateWeight = GlobalKey();
  GlobalKey<FormState> formstateHeight = GlobalKey();
  CollectionReference addinformation = FirebaseFirestore.instance.collection('addinformation');

  Future<void> addUser() {
    // Call the user's CollectionReference to add a new user
    return addinformation
        .add({
      'age':age.text,
      'weight': weight.text,
      'height': height.text
    })
     .then((value) =>Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) =>HomePage(),
      ),))

        .catchError((error) => print("Failed to add user: $error"));
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: const Color(0xFFEFF0E5),
            body: Column(
              children: [
                Container(
                  height: 40,
                ),
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(bottom: 15, top: 45),
                  child: const Text(
                    "Please Give us your Information ",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF3a4333),
                    ),
                  ),
                ),
                Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(right: 30, left: 30),
                    child: const Text(
                      "This helps us create your",
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFF3a4333),
                      ),
                    )),
                Container(
                    margin: const EdgeInsets.only(bottom: 30),
                    alignment: Alignment.center,
                    child: const Text("personalized plan ",
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xFF3a4333),
                        ))),
                Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  child: Form(
                      key: formstateAge,
                      child: TextFormField(
                        controller: age,
                        maxLength: 2,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.black, width: 3),
                                borderRadius: BorderRadius.circular(35)),
                            labelText: " Age",
                            labelStyle: const TextStyle(color: Colors.black),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(
                                    color: Color(0xFF5f765e), width: 3))),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please Enter Your age";
                          }
                        },
                      )),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  child: Form(
                      key: formstateWeight,
                      child: TextFormField(
                        controller: weight,
                        maxLength: 5,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.black, width: 3),
                                borderRadius: BorderRadius.circular(35)),
                            labelText: " Weight(KG)",
                            labelStyle: const TextStyle(color: Colors.black),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(
                                    color: Color(0xFF5f765e), width: 3))),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please Enter Your Weight(KG)";
                          }
                        },
                      )),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 5),
                  child: Form(
                      key: formstateHeight,
                      child: TextFormField(
                        controller: height,
                        maxLength: 3,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.black, width: 3),
                                borderRadius: BorderRadius.circular(35)),
                            labelText: " Height(cm)",
                            labelStyle: const TextStyle(color: Colors.black),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(
                                    color: Color(0xFF5f765e), width: 3))),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please Enter Your height(cm)";
                          }
                        },
                      )),
                ),
                MaterialButton(
                  minWidth: 350,
                  textColor: Colors.white,
                  color: const Color(0xFF5f765e),
                  onPressed: () {
                    if (formstateAge.currentState!.validate() &&
                        formstateWeight.currentState!.validate() &&
                        formstateHeight.currentState!.validate()) {

                      addUser();

                    }
                  },
                  child: const Text("Continue"),
                )
              ],
            )));
  }
}