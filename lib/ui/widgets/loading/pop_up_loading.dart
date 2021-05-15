import 'package:flutter/material.dart';
import 'package:gorin_users/ui/widgets/loading/simple_loading.dart';

class PopUpLoading extends StatelessWidget {
  final String message;

  const PopUpLoading({Key key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: EdgeInsets.all(16),
        color: Colors.blueGrey[200].withOpacity(0.7),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            SimpleLoading(),
            SizedBox(
              height: 32,
            ),
            Text(message ?? "",
                style: TextStyle(
                  color: Colors.blueGrey[700],
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                )),
          ],
        ),
      ),
    );
  }
}
