import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
class StorageMethod{
  final FirebaseStorage _firebaseStorage=FirebaseStorage.instance;
  final FirebaseAuth _auth=FirebaseAuth.instance;
  Future<String> uploadImageToStorage({required String childname,required Uint8List file})async{
   Reference ref= _firebaseStorage.ref().child(childname).child(_auth.currentUser!.uid);
   UploadTask uploadTask=ref.putData(file);
   TaskSnapshot snap=await uploadTask;
   String downloadurl=await snap.ref.getDownloadURL();
   return downloadurl;
  }
}