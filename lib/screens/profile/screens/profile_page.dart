// ignore_for_file: unused_element

import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:multi_image_picker_plus/multi_image_picker_plus.dart';
import 'package:path_provider/path_provider.dart';
import '../../../widgets/appBar/custom_appBar.dart';
import '../model/user_data.dart';

import '../model/user.dart';
import '../../../widgets/images/display_image_widget.dart';
import 'edit_description.dart';
import 'edit_email.dart';
import 'edit_name.dart';
import 'edit_phone.dart';

// This class handles the Page to dispaly the user's info on the "Edit Profile" Screen
class ProfilePage extends StatefulWidget {
   ProfilePage({super.key});
  List <QueryDocumentSnapshot> data= [];


  // getdata()async {
  //   QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection(
  //       "users").get();
  //   data.addAll(querySnapshot.docs);
  //    setState(() {
  //
  //   });
  // }



  @override
  _ProfilePageState createState() => _ProfilePageState();


   }

class _ProfilePageState extends State<ProfilePage> {
  List<File> images_File = [];


  final currentUser = FirebaseAuth.instance.currentUser!;
  String username='';
  String email='';
  final CollectionReference users =
  FirebaseFirestore.instance.collection('users');

  @override
  void initState() {
    super.initState();
    fetchUserEmail();
  }

  Future<void> fetchUserEmail() async {
    try{
      DocumentSnapshot userDoc = await users.doc(currentUser.uid).get();
      String email = userDoc['email'] ?? '';
      String name = userDoc['username'] ?? '';
      print("$userDoc['email]");
      setState(() {
        this.email = email;
        username = name;
      });
    } catch (e) {
      print(e.toString());
    }
    }

    @override
  Widget build(BuildContext context) {
    final user = UserData.myUser;

    return Scaffold(
      appBar: Custom_AppBar(''),
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: Column(
          children: [
            InkWell(
                onTap: () {
                  // navigateSecondPage(const EditImagePage());

                  _getImages();
                },
                child: DisplayImage(
                  imagePath: user.image,
                  onPressed: () {},
                  images_File: images_File,
                )),
            buildUserInfoDisplay(username, 'Name', const EditNameFormPage()),
            buildUserInfoDisplay(user.phone, 'Phone', const EditPhoneFormPage()),
            buildUserInfoDisplay(email, 'Email', const EditEmailFormPage()),
            buildUserInfoDisplay(user.aboutMeDescription, 'description', EditDescriptionFormPage()),
            //Expanded(
             // flex: 4,
              //child: buildAbout()
          ],
        ),
      ),
    );
  }

  Future<void> _getImages() async {
    List<Asset> pickedImages = [];
    try {
      pickedImages = await MultiImagePicker.pickImages();
    } catch (e) {
      print('Error picking images: $e');
    }

    if (pickedImages.isNotEmpty) {
      List<File> images = [];
      for (var pickedImage in pickedImages) {
        try {
          final ByteData byteData = await pickedImage.getByteData();
          final List<int> imageData = byteData.buffer.asUint8List();
          final tempDir = await getTemporaryDirectory();
          final tempFile = File('${tempDir.path}/${pickedImage.name}');
          await tempFile.writeAsBytes(imageData);
          images.add(tempFile);
        } catch (e) {
          print('Error converting asset to file: $e');
        }
      }
      setState(() {
        images_File = images;
      });
    }
  }

  // Widget builds the display item with the proper formatting to display the user's info
  Widget buildUserInfoDisplay(String getValue, String title, Widget editPage) => Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
            const SizedBox(
              height: 1,
            ),
            Container(
                width: 350,
                height:40,
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                  color: Colors.grey,
                  width: 1,
                ))),
                child: Row(children: [
                  Expanded(
                      child: TextButton(
                          onPressed: () {
                            navigateSecondPage(editPage);
                          },
                          child: Text(
                            getValue,
                            style: const TextStyle(fontSize: 16, height: 1.4),
                          ))),
                  const Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.grey,
                    size: 40.0,
                  )
                ]))
          ],
        ),
      ));

  // Widget builds the About Me Section
  // Widget buildAbout() => Padding(
  //     padding: const EdgeInsets.only(bottom: 10),
  //     child: SingleChildScrollView(
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           const Text(
  //             'description',
  //             style: TextStyle(
  //               fontSize: 15,
  //               fontWeight: FontWeight.w500,
  //               color: Colors.grey,
  //             ),
  //           ),
  //           const SizedBox(height: 1),
  //           Container(
  //               width: 350,
  //               height: 100,
  //               decoration: const BoxDecoration(
  //                   border: Border(
  //                       bottom: BorderSide(
  //                 color: Colors.grey,
  //                 width: 1,
  //               ))),
  //               child: Row(children: [
  //                 Expanded(
  //                     child: TextButton(
  //                         onPressed: () {
  //                           navigateSecondPage(EditDescriptionFormPage());
  //                         },
  //                         child: Padding(
  //                             padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
  //                             child: Align(
  //                                 alignment: Alignment.topLeft,
  //                                 child: Text(
  //                                   '',
  //                                   style: const TextStyle(
  //                                     fontSize: 16,
  //                                     height: 1.4,
  //                                   ),
  //                                 ))))),
  //                 const Icon(
  //                   Icons.keyboard_arrow_right,
  //                   color: Colors.grey,
  //                   size: 40.0,
  //                 )
  //               ]))
  //         ],
  //       ),
  //     ));

  // Refrshes the Page after updating user info.
  FutureOr onGoBack(dynamic value) {
    setState(() {});
  }

  // Handles navigation and prompts refresh.
  void navigateSecondPage(Widget editForm) {
    Route route = MaterialPageRoute(builder: (context) => editForm);
    Navigator.push(context, route).then(onGoBack);
  }
}
