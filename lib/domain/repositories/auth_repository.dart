abstract class AuthRepository {
  Future<bool> isAuthenticated();
  Future<String> getUserId();
  Future<String> loginUser(String email, String password);
  Future<String> registerUser(String email, String password);
  Future<void> logoutUser();
}
