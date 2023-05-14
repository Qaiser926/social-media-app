
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tech_media/res/color.dart';

class Utiles{

  static void fieldFocusNode(BuildContext context, FocusNode currentFocus, FocusNode nextFocus){
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static void toastMessage(String message){
    Fluttertoast.showToast(msg: message,
    textColor: AppColors.whiteColor,
    backgroundColor: AppColors.primaryTextTextColor,
    );
  }
}