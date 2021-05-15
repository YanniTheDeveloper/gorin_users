import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final Function() onLoginTap;

  const LoginButton({Key key, this.onLoginTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
        child: ElevatedButton(
            onPressed: onLoginTap,
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
