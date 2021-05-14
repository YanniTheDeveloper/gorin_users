import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gorin-Users"),
      ),
      body: Center(
        child: Text(
          'No users yet!',
        ),
      ),
    );
  }
}
