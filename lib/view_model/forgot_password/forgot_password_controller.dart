import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_media/utils/routes/route_name.dart';
import 'package:tech_media/utils/utiles.dart';
import 'package:tech_media/view_model/splash_servies/sasionMananger.dart';

class ForgotController with ChangeNotifier{

FirebaseAuth auth=FirebaseAuth.instance;
bool _ialoading=false;
  bool get isloading=>_ialoading;

  setIsLoading(bool value){
    _ialoading =value;
    notifyListeners();
  }

  void forgotPassword(BuildContext context, String email)async{
    setIsLoading(true);
    try {
       auth.sendPasswordResetEmail(
        email: email
         ).then((value) {
          setIsLoading(false);
              Navigator.pushNamed(context, RouteName.LoginPage);
        Utiles.toastMessage("Please check your email to recover your password");
       }).onError((error, stackTrace) {
        setIsLoading(false);
        Utiles.toastMessage(error.toString());
       });
    } catch (e) {
      setIsLoading(false);
      Utiles.toastMessage(e.toString());    }
  }

}