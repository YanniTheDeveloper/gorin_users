import 'package:flutter/material.dart';

class LogoutButton extends StatelessWidget {
  final Function() onLogoutTap;

  const LogoutButton({Key key, this.onLogoutTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 16),
        child: ElevatedButton(
            onPressed: onLogoutTap,
            style: ButtonStyle(
                elevation: MaterialStateProperty.all(5),
                backgroundColor:
                    MaterialStateProperty.all(Colors.blueGrey[100])),
            child: Container(
                padding: EdgeInsets.all(8),
                child: Text("Logout",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.blueGrey[600])))));
  }
}
