import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gorin_users/bloc/auth/auth_bloc.dart';
import 'package:gorin_users/bloc/users/users_bloc.dart';
import 'package:gorin_users/ui/widgets/buttons/logout_button.dart';
import 'package:gorin_users/ui/widgets/loading/simple_loading.dart';
import 'package:gorin_users/ui/widgets/tiles/users_list_tile.dart';

class HomePage extends StatelessWidget {
  static const id = "HomePage";

  @override
  Widget build(BuildContext context) {
    log("In $id");
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Users",
            style: TextStyle(
                color: Colors.black87,
                fontSize: 24,
                letterSpacing: 0.1,
                fontWeight: FontWeight.w800)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: BlocBuilder<UsersBloc, UsersState>(
        builder: (context, state) {
          if (state is UsersLoading) {
            // @TODO loading
            return SimpleLoading();
          } else if (state is UsersLoaded) {
            return Stack(children: [
              ListView.separated(
                padding: EdgeInsets.only(bottom: 24),
                itemCount: state.users.length,
                itemBuilder: (context, index) {
                  return UsersListTile(
                      userEntity: state.users.elementAt(index));
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider();
                },
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: LogoutButton(
                      onLogoutTap: () => BlocProvider.of<AuthBloc>(context).add(
                            LogOutRequest(),
                          )))
            ]);
          } else if (state is UsersEmpty) {
            return Center(child: Text("No users yet"));
          } else {
            return Center(child: Text("Error Loading"));
          }
        },
      ),
    );
  }
}
