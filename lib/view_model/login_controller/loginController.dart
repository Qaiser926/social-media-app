import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_media/utils/routes/route_name.dart';
import 'package:tech_media/utils/utiles.dart';
import 'package:tech_media/view_model/splash_servies/sasionMananger.dart';

class LoginController with ChangeNotifier{

FirebaseAuth auth=FirebaseAuth.instance;
bool _ialoading=false;
  bool get isloading=>_ialoading;

  setIsLoading(bool value){
    _ialoading =value;
    notifyListeners();
  }

  void Login(BuildContext context, String email, String password)async{
    setIsLoading(true);
    try {
       auth.signInWithEmailAndPassword(
        email: email,
         password: password
         ).then((value) {
          SessionController().userId=value.user!.uid.toString();           setIsLoading(false);
              Navigator.pushNamed(context, RouteName.DashBoardScreen);
        

       }).onError((error, stackTrace) {
        setIsLoading(false);
        Utiles.toastMessage(error.toString());
       });
    } catch (e) {
      setIsLoading(false);
      Utiles.toastMessage(e.toString());    }
  }

}