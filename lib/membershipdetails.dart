import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';



class MemberShipDetails extends StatefulWidget {
  const MemberShipDetails({Key? key}) : super(key: key);

  @override
  _MemberShipDetailsState createState() => _MemberShipDetailsState();
}

class _MemberShipDetailsState  extends State<MemberShipDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Member Ship Details'),
      ),
      body: Center(
        child: Text('Your filter content here'),
      ),
    );
  }
}
