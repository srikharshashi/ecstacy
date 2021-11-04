import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FB_Storage {
  Future<String> uploadFile(File? file,  String username) async {
    String url = "";
    if (file != null) {
      try {
        var snapshot = await FirebaseStorage.instance
            .ref('users/$username/img')
            .putFile(file);
        url = await snapshot.ref.getDownloadURL();
      } on FirebaseException catch (e) {
        // e.g, e.code == 'canceled'
      }
    }
    return url;
  }

 
}
