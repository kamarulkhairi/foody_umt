import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'dart:io';





class FirebaseServices{
  FirebaseAuth auth = FirebaseAuth.instance;
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
      

  Future<String> uploadFile(String filePath) async {
    User user = auth.currentUser;
  File file = File(filePath);
  var storageRef = storage.ref().child('user').child('profile').child('${user.uid}');
        

  try {
    var uploadTask = storageRef.putFile(file);
    var completedTask = await uploadTask.onComplete;
    String taskURL = await completedTask.ref.getDownloadURL();
    return taskURL;
  } on firebase_core.FirebaseException catch (e) {
    print(e);
    String error ='$e';
    return error;
  }
}
}