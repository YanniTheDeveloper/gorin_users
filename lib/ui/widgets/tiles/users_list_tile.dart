import 'package:flutter/material.dart';
import 'package:gorin_users/domain/entities/user_entity.dart';
import 'package:gorin_users/utilities/convertors/time_convertor.dart';

class UsersListTile extends StatelessWidget {
  final UserEntity userEntity;

  const UsersListTile({Key key, @required this.userEntity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading:
//      Icon(Icons.person),
      Container(
        child: ClipRRect(
            borderRadius: BorderRadius.all(
                Radius.circular(48)),
            child: Container(
              child:
              FadeInImage(
                image: NetworkImage(userEntity.imageUrl??''),
                placeholder: AssetImage(
                    "./assets/icons/avatar_256.png"),
                fit: BoxFit.cover,
              ),
              height: 40,
              width: 40,
            )),
      ),
      title: Text(userEntity.name ?? "",
          style: TextStyle(
              fontSize: 16, letterSpacing: 0.1, fontWeight: FontWeight.w700)),

      subtitle: Text(userEntity.email ?? "",
          style: TextStyle(
              fontSize: 14, letterSpacing: 0.1, fontWeight: FontWeight.w400)),
      trailing: Text("Joined ${TimeToMomentConvertor.convert(userEntity.joined)}",
          style: TextStyle(
              fontSize: 14, letterSpacing: 0.1, fontWeight: FontWeight.w300)),
    );
  }
}
