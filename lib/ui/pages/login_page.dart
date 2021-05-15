import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gorin_users/bloc/auth/auth_bloc.dart';
import 'package:gorin_users/domain/entities/credential_entity.dart';
import 'package:gorin_users/domain/entities/user_entity.dart';
import 'package:gorin_users/ui/pages/register_page.dart';
import 'package:gorin_users/ui/widgets/buttons/login_button.dart';
import 'package:gorin_users/ui/widgets/inputs/email_input.dart';
import 'package:gorin_users/ui/widgets/inputs/password_input.dart';
import 'package:gorin_users/ui/widgets/loading/pop_up_loading.dart';

class LoginPage extends StatelessWidget {
  static const id = "LoginPage";
  final CredentialEntity _credentialEntity = CredentialEntity.empty();

  @override
  Widget build(BuildContext context) {
    log("In $id");
    return Scaffold(
        backgroundColor: Colors.blueGrey[200],
        body: BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is Authenticating) {
                log("authenticating . . .");
                showDialog(
                        context: context,
                        builder: (BuildContext context) =>
                            PopUpLoading(message: "Logging user in ..."))
                    .timeout(Duration(milliseconds: 3000));
              } else if (state is FailedToAuthenticate) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text("Failed to login!")));
              } else {}
            },
            child: SafeArea(
                child: Container(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Center(
                  child: SingleChildScrollView(
                      child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                      child: Text(
                    "Login with email",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.blueGrey[700],
                        fontWeight: FontWeight.w400),
                  )),
                  Container(
                    margin: EdgeInsets.all(24),
                    child: Column(
                      children: <Widget>[
                        EmailInput(
                          onEmailChanged: (String email) {
                            _credentialEntity.email = email;
                          },
                        ),
                        PasswordInput(
                          onPasswordChanged: (String password) {
                            _credentialEntity.password = password;
                          },
                        ),
                        LoginButton(onLoginTap: () {
                          log("User: ${_credentialEntity.email}, password: ${_credentialEntity.password}");
                          BlocProvider.of<AuthBloc>(context)
                              .add(LogInRequest(_credentialEntity));
                        }),
                      ],
                    ),
                  ),
                  Center(child: Text("Don't have an account?")),
                  Center(
                      child: TextButton(
                    child: Text("Sign Up"),
                    onPressed: () {
                      Navigator.of(context).pushNamed(RegisterPage.id);
                    },
                  )),
                ],
              ))),
            ))));
  }
}
