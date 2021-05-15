import 'package:flutter/material.dart';

class NameInput extends StatelessWidget {
  final Function(String) onNameChanged;

  const NameInput({Key key, @required this.onNameChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(top: 12),
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 24),
        child: TextFormField(
          onChanged: (value) => onNameChanged(value),
            style: TextStyle(
                fontSize: 18,
                letterSpacing: 0.1,
                //  color: Colors,
                fontWeight: FontWeight.w500),
            decoration: InputDecoration(
              hintText: "Name",
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              hintStyle: TextStyle(
                  fontSize: 18,
                  letterSpacing: 0.1,
                  //  color: Colors,
                  fontWeight: FontWeight.w500),
            )),
      ),
    );
  }
}
