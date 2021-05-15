import 'package:meta/meta.dart';

class CredentialEntity {
  String email;
  String password;
  CredentialEntity.empty();
  CredentialEntity({@required this.email, @required this.password});
}
