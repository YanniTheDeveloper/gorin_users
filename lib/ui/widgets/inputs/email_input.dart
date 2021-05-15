import 'package:flutter/material.dart';

class EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(top: 12),
      elevation: 5,
      child: Padding(
          padding: EdgeInsets.symmetric(vertical: 4, horizontal: 24),
          child: TextFormField(
            style: TextStyle(
                fontSize: 18,
                letterSpacing: 0.1,
                //  color: Colors,
                fontWeight: FontWeight.w500),
            decoration: InputDecoration(
              hintText: "Email",
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              hintStyle: TextStyle(
                  fontSize: 18,
                  letterSpacing: 0.1,
                  //  color: Colors,
                  fontWeight: FontWeight.w500),
            ),
          )),
    );
  }
}
