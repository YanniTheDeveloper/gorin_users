import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gorin_users/ui/pages/register_page.dart';
import 'package:gorin_users/ui/widgets/buttons/login_button.dart';
import 'package:gorin_users/ui/widgets/inputs/email_input.dart';
import 'package:gorin_users/ui/widgets/inputs/password_input.dart';

class LoginPage extends StatelessWidget {
  static const id = "LoginPage";

  @override
  Widget build(BuildContext context) {
    log("In $id");
    return Scaffold(
        backgroundColor: Colors.blueGrey[200],
        body: SafeArea(
            child: Container(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Center(
              child: SingleChildScrollView(
                  child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                  child: Text(
                "Login with email",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.blueGrey[700],
                    fontWeight: FontWeight.w400),
              )),
              Container(
                margin: EdgeInsets.all(24),
                child: Column(
                  children: <Widget>[
                    EmailInput(),
                    PasswordInput(),
                    LoginButton(),
                  ],
                ),
              ),
              Center(child: Text("Don't have an account?")),
              Center(
                  child: TextButton(
                child: Text("Sign Up"),
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed(RegisterPage.id);
                },
              )),
            ],
          ))),
        )));
  }
}
