import 'dart:convert';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:crypto/crypto.dart';

class StorageRepository {
  final FirebaseAuth authentication;
  final FirebaseStorage storage;

  const StorageRepository({
    required this.authentication,
    required this.storage,
  });

  Future<String> uploadFile(
    XFile file,
    String path,
  ) async {
    String fileName = generateFileName(file.name);

    UploadTask task = storage
        .ref("users/${authentication.currentUser!.uid}/$path/$fileName")
        .putFile(File(file.path));

    await task;

    return storage
        .ref("users/${authentication.currentUser!.uid}/$path/$fileName")
        .getDownloadURL();
  }

  String generateFileName(String path) {
    final List<String> split = path.split("/");
    final List<String> nameSplited = split.last.split(".");

    final String ext = nameSplited.last;
    final String basename = md5
        .convert(
          utf8.encode(nameSplited.first),
        )
        .toString();

    return "$basename.$ext";
  }
}
