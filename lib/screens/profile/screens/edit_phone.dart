import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart';
import '../../../widgets/appBar/custom_appBar.dart';
import '../model/user_data.dart';

// This class handles the Page to edit the Phone Section of the User Profile.
class EditPhoneFormPage extends StatefulWidget {
  const EditPhoneFormPage({Key? key}) : super(key: key);
  @override
  EditPhoneFormPageState createState() {
    return EditPhoneFormPageState();
  }
}

class EditPhoneFormPageState extends State<EditPhoneFormPage> {
  final _formKey = GlobalKey<FormState>();
  final phoneController = TextEditingController();
  var user = UserData.myUser;
  CollectionReference users = FirebaseFirestore.instance.collection('users');



  Future<void> addUser(String uid) {
    // Call the user's CollectionReference to add a new user with the UID
    return users
        .doc(uid) // Use the UID as the document ID
        .update({
      'phoneController': phoneController.text,

    });

  }


  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  void updateUserValue(String phone) {
    String formattedPhoneNumber = "(${phone.substring(0, 3)}) ${phone.substring(3, 6)}-${phone.substring(6, phone.length)}";
    user.phone = formattedPhoneNumber;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Custom_AppBar(''),
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.only(top: 50),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
              const SizedBox(
                  width: 320,
                  child: Text(
                    "What's Your Phone Number?",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  )),
              Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: SizedBox(
                      height: 100,
                      width: 320,
                      child: TextFormField(
                        // Handles Form Validation
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your phone number';
                          } else if (isAlpha(value)) {
                            return 'Only Numbers Please';
                          } else if (value.length < 10) {
                            return 'Please enter a VALID phone number';
                          }
                          return null;
                        },
                        controller: phoneController,
                        decoration: const InputDecoration(
                          labelText: 'Your Phone Number',
                        ),
                      ))),
              Padding(
                  padding: const EdgeInsets.only(top: 150),
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        width: 320,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            // Validate returns true if the form is valid, or false otherwise.
                            if (_formKey.currentState!.validate() && isNumeric(phoneController.text)) {
                              updateUserValue(phoneController.text);

                              final currentUser = FirebaseAuth.instance.currentUser!;
                              addUser(currentUser.uid);
                              Navigator.pop(context);
                            }
                          },
                          child: const Text(
                            'Update',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      )))
            ]),
          ),
        ));
  }
}
