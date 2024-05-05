import 'dart:io';

import 'package:flutter/material.dart';

class DisplayImage extends StatelessWidget {
  final String imagePath;
  final VoidCallback onPressed;

  List<File> images_File;

  // Constructor
  DisplayImage({
    Key? key,
    required this.imagePath,
    required this.onPressed,
    required this.images_File,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const color = Color.fromRGBO(64, 105, 225, 1);
    final image = imagePath.contains('https://') ? NetworkImage(imagePath) : FileImage(File(imagePath));

    return Center(
      child: Stack(
        children: [
          images_File.isEmpty
              ? CircleAvatar(
                  radius: 75,
                  backgroundColor: color,
                  child: CircleAvatar(
                    backgroundImage: image as ImageProvider,
                    radius: 70,
                  ),
                )
              : CircleAvatar(
                  radius: 80,
                  backgroundImage: FileImage(images_File.first),
                ),
          Positioned(
            right: 4,
            top: 10,
            child: buildEditIcon(color),
          )
        ],
      ),
    );
  }

  // Builds Edit Icon on Profile Picture
  Widget buildEditIcon(Color color) => buildCircle(
      all: 8,
      child: Icon(
        Icons.edit,
        color: color,
        size: 20,
      ));

  // Builds/Makes Circle for Edit Icon on Profile Picture
  Widget buildCircle({
    required Widget child,
    required double all,
  }) =>
      ClipOval(
          child: Container(
        padding: EdgeInsets.all(all),
        color: Colors.white,
        child: child,
      ));
}
