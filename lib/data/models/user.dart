import 'package:meta/meta.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:gorin_users/utilities/convertors/timestamp_convertor.dart';

part 'user.g.dart';

@JsonSerializable(includeIfNull: false)
class User {
  final String id;
  final String name;
  final String email;
  final String imageUrl;
  @TimestampConverter()
  final DateTime joined;

  User({this.id, @required this.name, @required this.email, @required this.imageUrl, @required this.joined});

  Map<String, dynamic> toJson() => _$UserToJson(this)..remove("id");
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}