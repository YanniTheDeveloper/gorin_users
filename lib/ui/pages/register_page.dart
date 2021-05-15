import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gorin_users/bloc/auth/auth_bloc.dart';
import 'package:gorin_users/domain/entities/credential_entity.dart';
import 'package:gorin_users/domain/entities/image_holder.dart';
import 'package:gorin_users/domain/entities/user_entity.dart';
import 'package:gorin_users/ui/pages/login_page.dart';
import 'package:gorin_users/ui/widgets/buttons/register_button.dart';
import 'package:gorin_users/ui/widgets/image_holders/profile_image_input.dart';
import 'package:gorin_users/ui/widgets/inputs/email_input.dart';
import 'package:gorin_users/ui/widgets/inputs/name_input.dart';
import 'package:gorin_users/ui/widgets/inputs/password_input.dart';
import 'package:gorin_users/ui/widgets/loading/pop_up_loading.dart';
import 'package:gorin_users/utilities/helper/image_tool.dart';

class RegisterPage extends StatelessWidget {
  static const id = "RegisterPage";
  final UserEntity _userEntity = UserEntity.empty();
  final CredentialEntity _credentialEntity = CredentialEntity.empty();
  final ImageHolder _imageHolder = ImageHolder.empty();
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
                      PopUpLoading(message: "Registering user ..."));
            } else if (state is FailedToAuthenticate) {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Failed to register user!")));
            } else {
              Navigator.pop(context);
            }
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
                        "Sign up with email",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.blueGrey[700],
                            fontWeight: FontWeight.w400),
                      )),
                      SizedBox(
                        height: 32,
                      ),
                      ProfileImageInput(
                        onImageTap: (File image){
                          _imageHolder.image = image;
                        },
                      ),

                      Container(
                        margin: EdgeInsets.all(24),
                        child: Column(
                          children: <Widget>[
                            NameInput(
                              onNameChanged: (String name) {
                                _userEntity.name = name;
                              },
                            ),
                            EmailInput(
                              onEmailChanged: (String email) {
                                _userEntity.email = email;
                              },
                            ),
                            PasswordInput(
                              onPasswordChanged: (String password) {
                                _credentialEntity.password = password;
                              },
                            ),
                            RegisterButton(onRegisterTap: () {
                              log("User: ${_userEntity.email}, password: ${_credentialEntity.password}");
                              BlocProvider.of<AuthBloc>(context).add(
                                  RegisterRequest(_imageHolder.image,
                                      _userEntity, _credentialEntity.password));
                            }),
                          ],
                        ),
                      ),
                      Center(child: Text("Already have an account?")),
                      Center(
                          child: TextButton(
                        child: Text("Login"),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      )),
                    ],
                  ))))),
        ));
  }
}
