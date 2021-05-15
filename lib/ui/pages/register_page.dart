import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gorin_users/ui/widgets/buttons/register_button.dart';
import 'package:gorin_users/ui/widgets/inputs/email_input.dart';
import 'package:gorin_users/ui/widgets/inputs/name_input.dart';
import 'package:gorin_users/ui/widgets/inputs/password_input.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    log("In Register screen");
    return Scaffold(
      backgroundColor: Colors.blueGrey[200],
      body: SafeArea(
          child: ListView(
        padding: EdgeInsets.fromLTRB(20, 80, 20, 0),
        children: <Widget>[
          Center(
              child: Text(
            "Sign up with email",
            style: TextStyle(
                fontSize: 18,
                color: Colors.blueGrey[700],
                fontWeight: FontWeight.w400),
          )),
          SizedBox(
            height: 32,
          ),
          CircleAvatar(
            backgroundColor: Colors.blueGrey[600],
            radius: 48,
            child: GestureDetector(
              child: Icon(
                Icons.person,
                size: 36,
                color: Colors.white,
              ),
              onTap: () {},
            ),
          ),
          Container(
            margin: EdgeInsets.all(24),
            child: Column(
              children: <Widget>[
                NameInput(),
                EmailInput(),
                PasswordInput(),
                RegisterButton(),
              ],
            ),
          ),
          Center(child: Text("Already have an account?")),
          Center(
              child: TextButton(
            child: Text("Login"),
            onPressed: () {},
          )),
        ],
      )),
    );
  }
}
