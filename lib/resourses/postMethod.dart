import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram_clone/model/postModel.dart';
import 'package:instagram_clone/resourses/storageImage.dart';
import 'package:uuid/uuid.dart';

class PostMethod{
  FirebaseFirestore _firestore=FirebaseFirestore.instance;
  Future<String>uploadPost({required String uid,required Uint8List file ,required String description,required String name,required String photourl})async{
    String res="some error occurs";
    try{
      print("befer try ${res}");
        String posturl=await StorageMethod().uploadImageToStorage(childname: 'posts', file: file,isPost: true);
        String postId=const Uuid().v1();
         PostModel postModel=PostModel(datepublised: DateTime.now(), uid: uid, description: description, name: name, photourl: photourl,postId: postId,likes: [],posturl:posturl );
         await _firestore.collection('posts').doc(postId).set(postModel.toJson());
         res="success";
    print("after try ${res}");
    }catch(e){
      res=e.toString();
    }
    print("complet try ${res}");
    return res;

  }
  //like post method
  Future<void>likePost({required String postId,required String uid,required List likes})
  async {
    try{
      if(likes.contains(uid))
        {
          await _firestore.collection('posts').doc(postId).update({
            'likes':FieldValue.arrayRemove([uid]),
          });
        }
      else{
        await _firestore.collection('posts').doc(postId).update({
           'likes':FieldValue.arrayUnion([uid]),
        });
      }


    }
  catch(e){
  print(e.toString());
  }

}
//messge method
Future<void>postcomment({required String comment,required String uid,required String postId,required String profilepic,required String name})
async {
  try{
    if(comment.isNotEmpty)
      {
        String commentId= const Uuid().v1();
        await _firestore.collection('posts').doc(postId).collection('comments').doc(commentId).set({
          'postId':postId,
          'profilepic':profilepic,
          'uid':uid,
          'comment':comment,
          'commentId':commentId,
          'datepublised':DateTime.now(),
          'name':name,

        });
      }

  }catch(e)
  {
    print(e.toString());
  }
}


}
