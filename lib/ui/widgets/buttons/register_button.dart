import 'package:flutter/material.dart';

class RegisterButton extends StatelessWidget {
  final Function() onRegisterTap;

  const RegisterButton({Key key, @required this.onRegisterTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 24),
        child: ElevatedButton(
            onPressed: onRegisterTap,
            style: ButtonStyle(
                elevation: MaterialStateProperty.all(5),
                backgroundColor:
                    MaterialStateProperty.all(Colors.blueGrey[100])),
            child: Container(
                padding: EdgeInsets.all(8),
                child: Text("Sign Up",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.blueGrey[600])))));
  }
}
