import 'dart:developer';

import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    log("In Login screen");
    return Scaffold(
      body: Center(
        child: Text(
          'Login to Gorin-Users',
        ),
      ),
    );
  }
}