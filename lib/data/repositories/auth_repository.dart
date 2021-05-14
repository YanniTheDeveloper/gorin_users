import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepositoryInterface {
  Future<String> loginUser(String email, String password);
  Future<String> registerUser(String email, String password);
  Future<void> logoutUser();
}

class AuthRepository implements AuthRepositoryInterface {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<String> loginUser(String email, String password) async =>
      (await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      )).user?.uid;

  @override
  Future<String> registerUser(String email, String password) async =>
      (await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      )).user?.uid;

  @override
  Future<void> logoutUser() => _auth.signOut();
}
