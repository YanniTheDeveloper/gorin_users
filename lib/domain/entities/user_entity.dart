import 'package:meta/meta.dart';

class UserEntity {
  final String id;
  final String name;
  final String email;
  final String imageUrl;
  final DateTime joined;

  UserEntity({this.id, @required this.name, @required this.email, @required this.imageUrl, @required this.joined});
}