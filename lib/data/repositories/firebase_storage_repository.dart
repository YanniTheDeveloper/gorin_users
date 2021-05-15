import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:gorin_users/domain/repositories/storage_repository.dart';
import 'package:meta/meta.dart';

class FirebaseStorageRepository implements StorageRepository{
  @override
  Future<String> uploadFile({@required File file, @required String userName, @required String extension}) async {
    try {
      String path = "$userName/${userName}_profile_image.$extension";

      Reference  storageReference = FirebaseStorage.instance.ref().child(path);
      UploadTask  uploadTask = storageReference.putFile(file);

      TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() {});
      String imageUrl = await  taskSnapshot.ref.getDownloadURL();

      return imageUrl;

    } catch (error) {
      return Future.error(error);
    }
  }
}
