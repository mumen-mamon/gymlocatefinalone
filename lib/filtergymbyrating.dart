
import 'package:flutter/material.dart';
import 'package:gym1/gyms/Armygym.dart';
import 'package:gym1/gyms/Platinumgym.dart';
import 'package:gym1/gyms/Vegagym.dart';
import 'package:gym1/gyms/Vfitgym.dart';
import 'package:gym1/gyms/goldgym.dart';
import 'package:gym1/screens/gym_name/gym_name.dart';
//import 'package:flutter/cupertino.dart';



class FilterGymbyRating extends StatefulWidget {
  const FilterGymbyRating({Key? key}) : super(key: key);

  @override
  _FilterGymbyRatingState createState() => _FilterGymbyRatingState();
}

class _FilterGymbyRatingState extends State<FilterGymbyRating> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFEEF0E5),
        appBar: AppBar(
          title: const Text(
            "Filter Gym By Rating",
            textAlign: TextAlign.center,
          ),
          backgroundColor: const Color(0xFFEEF0E5),
        ),
        body:ListView(
          children: [
            Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(bottom: 15, top: 15),
                child: const Text(
                  "This Feature Can help you choose your Gym ",
                  style: TextStyle(fontSize: 19, color: Color(0xFF3a4333)),
                )),
            Card(
                margin: const EdgeInsets.only(bottom: 20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(150)),
                child: ListTile(
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => Armygym(),
                      ),
                    );
                  },
                  tileColor: const Color(0xFFb6c4b7),
                  leading: ClipRRect(
                      borderRadius: BorderRadius.circular(150),
                      child: Image.asset(
                        "assets/armyIcon.jpeg",
                        fit: BoxFit.cover,
                      )),
                  title: const Text(
                    "Army Gym",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  subtitle: const Row(
                    children: [
                      Icon(
                        (Icons.star),
                        color: Colors.yellow,
                      ),
                      Icon(
                        (Icons.star),
                        color: Colors.yellow,
                      ),
                      Icon(
                        (Icons.star),
                        color: Colors.yellow,
                      ),
                      Icon(
                        (Icons.star),
                        color: Colors.yellow,
                      ),
                      Icon(
                        (Icons.star_half),
                        color: Colors.yellow,
                      ),
                    ],
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_outlined,
                    size: 30,
                    color: Colors.white,

                  ),
                  isThreeLine: true,
                )),
            Card(
                margin: const EdgeInsets.only(bottom: 20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(120)),
                child: ListTile(
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => Goldgym(

                        ),
                      ),
                    );
                  },
                  tileColor: const Color(0xFFb6c4b7),
                  leading: ClipRRect(
                      borderRadius: BorderRadius.circular(150),
                      child: Image.asset(
                        "assets/goldsGym.jpeg",
                        fit: BoxFit.cover,
                      )),
                  title: const Text(
                    "Gold's Gym",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  subtitle: const Row(
                    children: [
                      Icon(
                        (Icons.star),
                        color: Colors.yellow,
                      ),
                      Icon(
                        (Icons.star),
                        color: Colors.yellow,
                      ),
                      Icon(
                        (Icons.star),
                        color: Colors.yellow,
                      ),
                      Icon(
                        (Icons.star),
                        color: Colors.yellow,
                      ),
                      Icon(
                        (Icons.star),
                        color: Colors.yellow,
                      ),
                    ],
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_outlined,
                    size: 30,
                    color: Colors.white,
                  ),
                  isThreeLine: true,
                )),
            Card(
                margin: const EdgeInsets.only(bottom: 20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(120)),
                child: ListTile(
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => Vegagym(),
                      ),
                    );
                  },
                  tileColor: const Color(0xFFb6c4b7),
                  leading: ClipRRect(
                      borderRadius: BorderRadius.circular(150),
                      child: Image.asset(
                        "assets/vegaGym.jpeg",
                        fit: BoxFit.cover,
                      )),
                  title: const Text(
                    "Vega Gym",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  subtitle: const Row(
                    children: [
                      Icon(
                        (Icons.star),
                        color: Colors.yellow,
                      ),
                      Icon(
                        (Icons.star),
                        color: Colors.yellow,
                      ),
                      Icon(
                        (Icons.star),
                        color: Colors.yellow,
                      ),
                      Icon(
                        (Icons.star),
                        color: Colors.yellow,
                      ),
                    ],
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_outlined,
                    size: 30,
                    color: Colors.white,
                  ),
                  isThreeLine: true,
                )),
            Card(
                margin: const EdgeInsets.only(bottom: 20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(120)),
                child: ListTile(
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => Vfitgym(),
                      ),
                    );
                  },
                  tileColor: const Color(0xFFb6c4b7),
                  leading: ClipRRect(
                      borderRadius: BorderRadius.circular(150),
                      child: Image.asset(
                        "assets/vFitGym.jpeg",
                        fit: BoxFit.cover,
                      )),
                  title: const Text(
                    "Vfit Gym",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  subtitle: const Row(
                    children: [
                      Icon(
                        (Icons.star),
                        color: Colors.yellow,
                      ),
                      Icon(
                        (Icons.star),
                        color: Colors.yellow,
                      ),
                      Icon(
                        (Icons.star),
                        color: Colors.yellow,
                      ),
                    ],
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_outlined,
                    size: 30,
                    color: Colors.white,
                  ),
                  isThreeLine: true,
                )),
            Card(
                margin: const EdgeInsets.only(bottom: 20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(120)),
                child: ListTile(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Platinumgym(),
                      ),
                    );


                  },
                  tileColor: const Color(0xFFb6c4b7),
                  leading: ClipRRect(
                      borderRadius: BorderRadius.circular(150),
                      child: Image.asset(
                        "assets/platinumGym.jpeg",
                        fit: BoxFit.cover,
                      )),
                  title: const Text(
                    "Platinum Gym",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  subtitle: const Row(
                    children: [
                      Icon(
                        (Icons.star),
                        color: Colors.yellow,
                      ),
                      Icon(
                        (Icons.star),
                        color: Colors.yellow,
                      ),
                      Icon(
                        (Icons.star),
                        color: Colors.yellow,
                      ),
                      Icon(
                        (Icons.star_half),
                        color: Colors.yellow,
                      ),
                    ],
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_outlined,
                    size: 30,
                    color: Colors.white,
                  ),
                  isThreeLine: true,
                )),
          ],
        )
    );
  }
}