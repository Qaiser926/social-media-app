import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:tech_media/res/color.dart';

class RoundButton   extends StatelessWidget {
 final String title;
 final Color textColor;
 final Color color;
  bool isLoading;
  final VoidCallback onpress;

  RoundButton({
  required this.title,
  required this.onpress,
   this.textColor=AppColors.whiteColor,
   this.color=AppColors.primaryColor,
   this.isLoading=false
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isLoading?null:onpress ,
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),
        color: color
        
        ),
        height: 50,
        width: double.infinity,
      child:isLoading?Center(child: CircularProgressIndicator(color: Colors.white,),):
       Center(child: Text(title,
       style: Theme.of(context).textTheme.headline2!.copyWith(fontSize: 16,color: textColor))),
      
      ),
    );
  }
}