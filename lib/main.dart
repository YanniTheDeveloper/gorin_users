import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gorin_users/bloc/auth/auth_bloc.dart';
import 'package:gorin_users/bloc/users/users_bloc.dart';
import 'package:gorin_users/data/repositories/firebase_auth_repository.dart';
import 'package:gorin_users/data/repositories/firebase_user_repository.dart';
import 'package:gorin_users/ui/pages/home_page.dart';
import 'package:gorin_users/ui/pages/login_page.dart';
import 'package:gorin_users/ui/pages/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(BlocProvider(
    create: (_) => AuthBloc(
        authRepository: FirebaseAuthRepository(),
        userRepository: FirebaseUserRepository())
      ..add(AppStarted()),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gorin-Users',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is AppLoading) {
            // @TODO Splash Screen
            return SplashScreen();
          } else if (state is Authenticated) {
            return BlocProvider(
              create: (_) => UsersBloc(userRepository: FirebaseUserRepository())
                ..add(LoadUsers()),
              child: HomePage(),
            );
          } else {
            return LoginPage();
          }
        },
      ),
    );
  }
}
