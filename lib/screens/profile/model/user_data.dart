import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserData {
  static late SharedPreferences _preferences;
  static const _keyUser = 'user';

 
  static User myUser = User(
    image: "https://upload.wikimedia.org/wikipedia/en/0/0b/Darth_Vader_in_The_Empire_Strikes_Back.jpg",
    name:("name"),
    email: 'test.test@gmail.com',
    phone: '(+962) 7* *** ****',
    aboutMeDescription: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit ...',
  );





  

 



  static Future init() async => _preferences = await SharedPreferences.getInstance();

  static Future setUser(User user) async {
    final json = jsonEncode(user.toJson());

    await _preferences.setString(_keyUser, json);
  }

  static User getUser() {
    final json = _preferences.getString(_keyUser);

    return json == null ? myUser : User.fromJson(jsonDecode(json));
  }
}
