abstract class AuthRepositoryInterface{
  bool loginUser();
  bool registerUser();
  bool logoutUser();
}

class AuthRepository implements AuthRepositoryInterface{
  @override
  bool loginUser() {
    // TODO: implement loginUser
    throw UnimplementedError();
  }

  @override
  bool logoutUser() {
    // TODO: implement logoutUser
    throw UnimplementedError();
  }

  @override
  bool registerUser() {
    // TODO: implement registerUser
    throw UnimplementedError();
  }

}