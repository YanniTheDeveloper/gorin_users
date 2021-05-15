import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gorin_users/ui/widgets/loading/simple_loading.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    log("In splash screen");
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Gorin-Users',
            style: TextStyle(
              color: Colors.white12,
              fontSize: 54,
              fontWeight: FontWeight.bold,
            ),
          ),
          SimpleLoading()
        ],
      ),
    );
  }
}
