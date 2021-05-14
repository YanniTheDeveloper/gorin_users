import 'package:meta/meta.dart';

class UserEntity {
  String id;
  String name;
  String email;
  String imageUrl;
  DateTime joined;

  UserEntity({this.id, @required this.name, @required this.email, @required this.imageUrl, @required this.joined});
}