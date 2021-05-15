import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gorin_users/ui/widgets/loading/simple_loading.dart';

class SplashScreen extends StatelessWidget {
  static const id = "SplashPage";

  @override
  Widget build(BuildContext context) {
    log("In $id");
    return Scaffold(
      backgroundColor: Colors.blueGrey[600],
      body: Center(child :  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Gorin-Users',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 44,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 50,),
          SimpleLoading()
        ],
      )),
    );
  }
}
