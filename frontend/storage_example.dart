import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class StorageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  // Upload a file to Firebase Storage
  Future<String?> uploadFile(File file, String fileName) async {
    try {
      // Create a reference to the location you want to upload to
      Reference ref = _storage.ref().child('uploads/$fileName');

      // Upload the file
      UploadTask uploadTask = ref.putFile(file);

      // Wait for the upload to complete
      TaskSnapshot snapshot = await uploadTask;

      // Get the download URL
      String downloadUrl = await snapshot.ref.getDownloadURL();
      return downloadUrl;
    } on FirebaseException catch (e) {
      print('Upload Error: ${e.message}');
      return null;
    }
  }

  // Delete a file
  Future<void> deleteFile(String fileName) async {
    try {
      await _storage.ref().child('uploads/$fileName').delete();
    } on FirebaseException catch (e) {
      print('Delete Error: ${e.message}');
    }
  }
}
