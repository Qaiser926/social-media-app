

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tech_media/utils/routes/route_name.dart';
import 'package:tech_media/view_model/splash_servies/sasionMananger.dart';

class SplashServies{

  void loginPage(BuildContext context){
FirebaseAuth auth=FirebaseAuth.instance;
final user=auth.currentUser;
if(user!=null ){
  SessionController().userId=user.uid.toString();
    Timer(Duration(milliseconds: 1000), () { 
      Navigator.pushNamed(context, RouteName.DashBoardScreen);
    });
}else{
    Timer(Duration(milliseconds: 1000), () { 
      Navigator.pushNamed(context, RouteName.LoginPage);
    });
}
  
  }
}
