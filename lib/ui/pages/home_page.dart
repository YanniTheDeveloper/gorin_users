import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gorin_users/bloc/auth/auth_bloc.dart';
import 'package:gorin_users/bloc/users/users_bloc.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gorin-Users"),
      ),
      body: BlocBuilder<UsersBloc, UsersState>(
        builder: (context, state) {
          if (state is UsersLoading) {
            // @TODO loading
            return Text("Loading");
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
