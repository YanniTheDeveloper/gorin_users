import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SimpleShimmerLoading extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.grey,
        child: SizedBox(height: 48, width: 48,),
      ),
      title: SizedBox(height: 20, width: 48, child: Container(color: Colors.grey,)),
      subtitle: SizedBox(height: 20, width: 72, child: Container(color: Colors.grey,)),
      trailing: SizedBox(height: 4, width: 4, child: Container(color: Colors.grey,)),
    );
  }
}