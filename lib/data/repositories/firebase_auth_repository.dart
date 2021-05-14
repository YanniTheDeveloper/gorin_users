import 'package:firebase_auth/firebase_auth.dart';
import 'package:gorin_users/domain/repositories/auth_repository.dart';


class FirebaseAuthRepository implements AuthRepository {
  final FirebaseAuth _auth;

  FirebaseAuthRepository({FirebaseAuth firebaseAuth})
      : _auth = firebaseAuth ?? FirebaseAuth.instance;

  @override
  Future<bool> isAuthenticated() async {
    final currentUser = _auth.currentUser;
    return currentUser != null;
  }

  @override
  Future<String> getUserId() async {
    return (_auth.currentUser).uid;
  }

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
