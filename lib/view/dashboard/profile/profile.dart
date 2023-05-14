import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:tech_media/res/color.dart';
import 'package:tech_media/view_model/splash_servies/sasionMananger.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final ref=FirebaseDatabase.instance.ref("users");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20,),
          Center(
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.textFieldFocusBorderColor,width: 1.5)
              ),
              height: 100,
              width: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image(image: NetworkImage("https://images.unsplash.com/flagged/photo-1571837360114-edf5dba7b1dd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
                ),
                loadingBuilder: (context,child,loadingProgress){
                  if(loadingProgress==null)return child;
                  return Center(child: CircularProgressIndicator(),);
                },
                errorBuilder: (context,object,stack){
                  return Icon(Icons.error_outline,size: 45,);
                },
                fit: BoxFit.cover,
                ),
              ),
              ),
          ),
          Expanded(
            child: StreamBuilder(
              stream: ref.child(SessionController().userId.toString()).onValue,
              builder: (context,AsyncSnapshot snapshot){
               if(!snapshot.hasData){
                return Center(child: CircularProgressIndicator(),);
               }
               else if (snapshot.hasData){
                    Map<dynamic , dynamic> map=snapshot.data.snapshot.value;
                 return Column(children: [
                  ListTile(
                    title: map['userName'],
                  )
                ],);
               }
               else{
                return Text("No Data Exit");
              
               }
              },
            ),
          )
        ],
      ),
    );
  }
}