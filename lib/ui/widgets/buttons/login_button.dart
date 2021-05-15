import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 24),
        child: ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
                elevation: MaterialStateProperty.all(5),
                backgroundColor:
                    MaterialStateProperty.all(Colors.blueGrey[100])),
            child: Container(
                padding: EdgeInsets.all(8),
                child: Text("Login",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.blueGrey[600])))));
  }
}
