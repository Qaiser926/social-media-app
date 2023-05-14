import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tech_media/res/fonts.dart';
import 'package:tech_media/res/round_button.dart';
import 'package:tech_media/utils/routes/routes.dart';

import '../../res/color.dart';
import '../../view_model/splash_servies/splashServies.dart';



class SplashScreen extends StatefulWidget {
   SplashScreen({Key? key}) : super(key: key);
 
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

 SplashServies splashServies=SplashServies();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashServies.loginPage(context);
    // Timer(Duration(milliseconds: 1000), () {Get.toNamed(generateRoute.)})
  }

  @override
  Widget build(BuildContext context) {

    initState(){}
    
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            //  Image(image: AssetImage('assets/images/logo.jpg')),
              const Padding(
                padding:  EdgeInsets.symmetric(vertical: 20),
                child: Center(child: Text('Social Media App' , style: TextStyle(fontFamily: AppFonts.sfProDisplayBold , fontSize: 40, fontWeight: FontWeight.w700,color: Colors.white),)),
              ),
              CircularProgressIndicator(color: Colors.white,),
               ],
          )
      ),
    );
  }
}
