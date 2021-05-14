import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gorin_users/data/models/user_model.dart';
import 'package:gorin_users/domain/entities/user_entity.dart';
import 'package:gorin_users/domain/repositories/user_repository.dart';
import 'package:meta/meta.dart';

class FirebaseUserRepository implements UserRepository {
  CollectionReference usersRef = FirebaseFirestore.instance.collection("users");

  @override
  Future<void> createUser({@required UserEntity userEntity}) async =>
      usersRef.add((UserModel.fromEntity(userEntity).toJson()));

  @override
  Stream<List<UserEntity>> getUsers() =>
      usersRef.snapshots().map((usersSnapshot) => usersSnapshot.docs
          .map((user) => UserModel.fromJson(user.data()))
          .toList());
}
