import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gorin_users/utilities/helper/image_tool.dart';

class ProfileImageInput extends StatefulWidget {
  final Function(File) onImageTap;

  const ProfileImageInput({Key key, this.onImageTap}) : super(key: key);
  _ProfileImageInputState createState() => _ProfileImageInputState();
}

class _ProfileImageInputState extends State<ProfileImageInput> {
  File image;

  setImage(File file){
    setState(() {
      image = file;
    });
  }
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.blueGrey[600],
      radius: 48,
      child: GestureDetector(
          child: ClipOval(
            child: image==null?Icon(
              Icons.person,
              size: 36,
              color: Colors.white,
            ): Image.file(image, fit: BoxFit.fill)
          ),
          onTap: () async {
            setImage(await ImageTool.getImage());
            return widget.onImageTap(image);
          }),
    );
  }
}
