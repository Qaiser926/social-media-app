
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tech_media/utils/routes/route_name.dart';
import 'package:tech_media/utils/utiles.dart';
import 'package:tech_media/view_model/splash_servies/sasionMananger.dart';

class SignupController with ChangeNotifier{

FirebaseAuth auth=FirebaseAuth.instance;
DatabaseReference ref=FirebaseDatabase.instance.ref().child("users");
  bool _ialoading=false;
  bool get isloading=>_ialoading;

  setIsLoading(bool value){
    _ialoading =value;
    notifyListeners();
  }

  void signUp(BuildContext context, String username, String email, String password)async{
    setIsLoading(true);
    try {
       auth.createUserWithEmailAndPassword(
        email: email,
         password: password
         ).then((value) {
          SessionController().userId=value.user!.uid.toString();   
          setIsLoading(false);
          ref.child(value.user!.uid.toString()).set({
          "uid":value.user!.uid.toString(),
          "email":value.user!.email.toString(),
          "onLineStatus":"noOne",
          "phone":"",
          "userName":username,
          "profile":"",
          


             
          }).then((value) {
              setIsLoading(false);
              Navigator.pushNamed(context, RouteName.DashBoardScreen);
          }).onError((error, stackTrace) {
              setIsLoading(false);
          });
         Utiles.toastMessage("user created successfully");
         setIsLoading(false);

       }).onError((error, stackTrace) {
        Utiles.toastMessage(error.toString());
       });
    } catch (e) {
      setIsLoading(false);
      Utiles.toastMessage(e.toString());    }
  }

}