
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';



class FilterGymbyRating extends StatefulWidget {
  const FilterGymbyRating({Key? key}) : super(key: key);

  @override
  _FilterGymbyRatingState createState() => _FilterGymbyRatingState();
}

class _FilterGymbyRatingState extends State<FilterGymbyRating> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filter Gyms by Rating'),
      ),
      body: Center(
        child: Text('Your filter content here'),
      ),
    );
  }
}
