import 'dart:io';

import 'package:gorin_users/domain/repositories/storage_repository.dart';
import 'package:meta/meta.dart';

class UploadFile {
  final StorageRepository _storageRepository;
  UploadFile(this._storageRepository);

  Future<String> execute(
      {@required File file, @required String userName, @required String extension}) =>
      _storageRepository.uploadFile(file: file, userName: userName, extension: extension);
}
