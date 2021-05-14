import 'package:gorin_users/domain/entities/user_entity.dart';
import 'package:meta/meta.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:gorin_users/utilities/convertors/timestamp_convertor.dart';

part 'user_model.g.dart';

@JsonSerializable(includeIfNull: false)
@immutable
class UserModel extends UserEntity {
  final String id;
  final String name;
  final String email;
  final String imageUrl;
  @TimestampConverter()
  final DateTime joined;

  UserModel(
      {this.id,
      @required this.name,
      @required this.email,
      @required this.imageUrl,
      @required this.joined});

  UserEntity toEntity() {
    return UserEntity(
        id: id, name: name, email: email, imageUrl: imageUrl, joined: joined);
  }

  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(
        id: entity.id,
        name: entity.name,
        email: entity.email,
        imageUrl: entity.imageUrl,
        joined: entity.joined);
  }

  Map<String, dynamic> toJson() => _$UserModelToJson(this)..remove("id");
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
