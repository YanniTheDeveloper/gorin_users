import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SimpleLoading extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(backgroundColor: Colors.blueGrey[100]);
  }
}