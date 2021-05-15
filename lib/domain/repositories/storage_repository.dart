import 'dart:io';
import 'package:meta/meta.dart';

abstract class StorageRepository {
  Future<String> uploadFile({@required File file, @required String userName, @required String extension});
}
