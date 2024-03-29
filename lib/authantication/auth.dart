import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart' ;

import 'user.dart'as Model;
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:firebase_storage/firebase_storage.dart';

class AuthanticateUser{

  final auth.FirebaseAuth _auth= auth.FirebaseAuth.instance;
  Model.User userffb(auth.User user){
    if(user!=null){
      return Model.User(uid: user.uid);
    }
    else
      return null;
  }
  // Model.User _userffb(auth.User? user) {
  //   // ignore: unnecessary_null_comparison
  //   return user != null ? Model.User(uid: user.uid) : null;
  //   // return Model.User(uid: user!.uid);
  // }

  Stream<Model.User> get user {
    return _auth.authStateChanges().map(userffb);
  }
    Future singout()async {
    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }}
//reset password
    Future resetPass(String mail)async{
    try{
       await _auth.sendPasswordResetEmail(email: mail);

      return '';
    }
    catch(e){
      print(e.toString());
      return null;
    }
    }
// sign in with email n pasword
  Future Signin(String email, String pass)async{
    try{
      auth.UserCredential result= await _auth.signInWithEmailAndPassword(email: email, password:pass);
      auth.User user=result.user;
      return userffb(user);
    }catch(e){
      print(e.toString());
      return null;

    }
  }
    //updatepasword
  // Future updatePass(String password)async{
  //   try{
  //     FirebaseUser user= await FirebaseAuth.instance.currentUser();
  //     user.updatePassword(password);
  //   }
  //   catch (e){
  //     print(e.toString());
  //     return null;
  //   }
  // }
  
  // registerd
  String imgurl=null;
  Future Signup(email,pass,image,name,phone,type,address,shopName,area)async{
    try{
      dynamic result= await _auth.createUserWithEmailAndPassword(email: email, password:pass);

      var user=result.user;
       var pimage= FirebaseStorage.instance.ref("images");
      var task=await pimage.putFile(image);
      var imgurl=await task.ref.getDownloadURL();
        await updateUserData(user.uid, name, email, imgurl, pass, phone,type,address,shopName,area);
      return  userffb(user);
    }catch(e) {
      print(e.toString());
      return null;
    }}
  dynamic userCol=FirebaseFirestore.instance.collection('user');
  Future updateUserData(id, name, email, imgurl, password,phone,type,address,shopName,area)async {
    return await userCol.doc(id).set(
        {
          'User Name': name,
          'Email': email,
          'ImageUrl': imgurl,
          'Password': password,
          'Phone Number': phone,
          'Type':type,
          'Address':address??"",
          'Shop Name':shopName??"",
          'Area':area,
        }
    );
  }
}

