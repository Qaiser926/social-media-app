import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:tech_media/res/color.dart';
import 'package:tech_media/utils/routes/route_name.dart';
import 'package:tech_media/view/dashboard/profile/profile.dart';
import 'package:tech_media/view_model/splash_servies/sasionMananger.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
 
 final controler=PersistentTabController(initialIndex: 0);
 FirebaseAuth auth=FirebaseAuth.instance;
 List<Widget> _buildScreen(){
  return const[
    Text("Message"),
    Text("Home"),
    Text("add"),
    Text("Home"),
    UserProfile()
  ];
 }
 List<PersistentBottomNavBarItem> _buildItem(){
  return [
    PersistentBottomNavBarItem(icon:const Icon(Icons.home,),
    activeColorPrimary: AppColors.primaryIconColor,
     inactiveIcon:const Icon(Icons.home,color: AppColors.textFieldDefaultBorderColor,)
    ),
    PersistentBottomNavBarItem(icon:const Icon(Icons.message),
    activeColorPrimary: AppColors.primaryIconColor,
    inactiveIcon:const Icon(Icons.message,color:AppColors.textFieldDefaultBorderColor)
    ),
    PersistentBottomNavBarItem(icon:const Icon(Icons.add,color: Colors.white,),
    activeColorPrimary: AppColors.primaryIconColor,
    inactiveIcon:const Icon(Icons.add,color: Colors.white,)
    ),
    PersistentBottomNavBarItem(icon:const Icon(Icons.add),
    activeColorPrimary: AppColors.primaryIconColor,
    inactiveIcon:const Icon(Icons.add,color: AppColors.textFieldDefaultBorderColor)
    ),
    PersistentBottomNavBarItem(icon:const Icon(Icons.person),
    activeColorPrimary: AppColors.primaryIconColor,
    inactiveIcon:const Icon(Icons.person,color:AppColors.textFieldDefaultBorderColor)
    ),
  ];
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("DashBoard"),
        actions: [
          IconButton(onPressed: (){
            auth.signOut().then((value) {
              SessionController().userId="";
              Navigator.pushNamed(context, RouteName.LoginPage);
            });
          }, icon:const Icon(Icons.logout))
        ],
      ),
      body: PersistentTabView(
        context,
        screens: _buildScreen(),
        items: _buildItem(),
        backgroundColor: AppColors.otpHintColor,
        decoration: NavBarDecoration(borderRadius: BorderRadius.circular(1)),
        navBarStyle: NavBarStyle.style15,
        controller: controler,
      )
      //  Container(
      //   child: Column(
      //     children: [
      //       // Text(SessionController().userId.toString())
      //     ],
      //   ),
      // ),
    );
  }
}