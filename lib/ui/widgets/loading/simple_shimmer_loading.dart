import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SimpleShimmerLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.grey,
        child: Shimmer.fromColors(
            baseColor: Colors.grey[300],
            highlightColor: Colors.grey[100],
            child: CircleAvatar(
              backgroundColor: Colors.grey,
            )),
      ),
      title: Shimmer.fromColors(
          baseColor: Colors.grey[400],
          highlightColor: Colors.grey[200],
          child: SizedBox(
            height: 16,
            width: 30,
            child: Container(color: Colors.grey, ),
          )),
      subtitle: SizedBox(
        height: 16,
        width: 40,
        child: Shimmer.fromColors(
            baseColor: Colors.grey[300],
            highlightColor: Colors.grey[100],
            child: Container(
              color: Colors.grey,
            )),
      ),
      trailing: SizedBox(
        height: 16,
        width: 40,
        child: Shimmer.fromColors(
            baseColor: Colors.grey[300],
            highlightColor: Colors.grey[100],
            child: Container(
              color: Colors.grey,
            )),
      ),
    );
  }
}
