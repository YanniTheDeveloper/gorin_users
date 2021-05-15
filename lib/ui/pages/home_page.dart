import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gorin_users/bloc/auth/auth_bloc.dart';
import 'package:gorin_users/bloc/users/users_bloc.dart';
import 'package:gorin_users/ui/widgets/loading/simple_loading.dart';

class HomePage extends StatelessWidget {
  static const id = "HomePage";

  @override
  Widget build(BuildContext context) {
    log("In $id");
    return Scaffold(
      appBar: AppBar(
        title: Text("Gorin-Users"),
      ),
      body: BlocBuilder<UsersBloc, UsersState>(
        builder: (context, state) {
          if (state is UsersLoading) {
            // @TODO loading
            return SimpleLoading();
          } else if (state is UsersLoaded) {
            return Column(
              children: [Text("Yanni"), Text("Moshe")],
            );
          } else if (state is UsersEmpty) {
            return Text("No users yet");
          } else {
            return Text("Error Loading");
          }
        },
      ),
    );
  }
}
