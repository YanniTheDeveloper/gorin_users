import 'package:flutter/material.dart';

class PasswordInput extends StatefulWidget {
  final Function(String) onPasswordChanged;

  const PasswordInput({Key key, this.onPasswordChanged}) : super(key: key);
  _PasswordInputState createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool _passwordHidden = true;

  alterPasswordVisibility(bool visible) {
    setState(() {
      _passwordHidden = visible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.only(top: 12),
        elevation: 5,
        child: Padding(
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 24),
            child: TextFormField(
              onChanged: (value) => widget.onPasswordChanged(value),
              style: TextStyle(
                  fontSize: 18,
                  letterSpacing: 0.1,
                  //  color: Colors,
                  fontWeight: FontWeight.w500),
              decoration: InputDecoration(
                hintText: "Password",
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                hintStyle: TextStyle(
                    fontSize: 18,
                    letterSpacing: 0.1,
                    //  color: Colors,
                    fontWeight: FontWeight.w500),
                suffixIcon: IconButton(
                  icon: Icon(_passwordHidden
                      ? Icons.visibility_off
                      : Icons.visibility),
                  onPressed: () {
                    alterPasswordVisibility(!_passwordHidden);
                  },
                ),
              ),
              obscureText: _passwordHidden,
            )));
  }
}
