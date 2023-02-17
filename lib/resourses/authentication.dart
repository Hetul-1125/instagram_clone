import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:instagram_clone/resourses/storageImage.dart';

class AuthMethod {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  //sign in method
  Future<String> signUpUser({
    required String email,
    required String password,
    required String name,
    required String bio,
    required Uint8List file,
  }) async {
    String res = "Some error occured";
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          name.isNotEmpty ||
          bio.isNotEmpty) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        print(cred.user!.uid);
        String photoUrl = await StorageMethod()
            .uploadImageToStorage(childname: 'profilepics', file: file);
        await _firestore.collection('user').doc(cred.user!.uid).set({
          'email': email,
          'uid': cred.user!.uid,
          'name': name,
          'bio': bio,
          'followers': [],
          'following': [],
          'photourl': photoUrl,
        });
        res = 'success';
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }


  // signUp method
   Future<String>loginMethod({required String email,required String password})async{
    String res="some error occurs";
    try{
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      res='success';
    }catch(e){
      res=e.toString();
    }
    return res;
   }

}
