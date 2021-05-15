import 'package:flutter/material.dart';

class RegisterButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 24),
        child: ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Colors.blueGrey[100])),
            child: Text("SIGN UP",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.blueGrey[600]))));
  }
}
