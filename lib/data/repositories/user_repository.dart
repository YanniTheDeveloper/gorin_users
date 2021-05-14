import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gorin_users/data/models/user.dart';

abstract class UserRepositoryInterface {
  Stream<List<User>> getUsers();
  Future<void> createUser(User user);
}

class UserRepository implements UserRepositoryInterface {
  CollectionReference usersRef = FirebaseFirestore.instance.collection("users");

  @override
  Future<void> createUser(User user) async => usersRef.add(user.toJson());

  @override
  Stream<List<User>> getUsers() => usersRef.snapshots().map((usersSnapshot) =>
      usersSnapshot.docs.map((user) => User.fromJson(user.data())).toList());
}
