import 'package:meta/meta.dart';

abstract class AuthRepository {
  Future<String> getUserId();
  Future<String> loginUser({@required String email, @required String password});
  Future<String> registerUser({@required String email, @required String password});
  Future<void> logoutUser();
}
