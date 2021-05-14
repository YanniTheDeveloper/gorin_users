import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gorin_users/data/models/user.dart';

abstract class UserRepositoryInterface{
  Stream getUsers();
  bool createUser(User user);
}

class UserRepository implements UserRepositoryInterface {
  CollectionReference usersRef = FirebaseFirestore.instance.collection("users");

  @override
  bool createUser(User user) {
    // TODO: implement createUser
    throw UnimplementedError();
  }

  @override
  Stream getUsers() {
    // TODO: implement getUsers
    throw UnimplementedError();
  }

}