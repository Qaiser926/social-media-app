

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:tech_media/res/input_textField.dart';
import 'package:tech_media/res/round_button.dart';
import 'package:tech_media/utils/routes/route_name.dart';
import 'package:tech_media/view_model/login_controller/loginController.dart';


class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final emailFocusNode = FocusNode();

  final passwordFocusNode = FocusNode();
  final _formKey=GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    return SafeArea(
      child: Scaffold(
        body:
    
         Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: height * 0.051,
                ),
                Text(
                  "Welecome To Social Media App",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontSize: 18),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Text(
                  "Enter your email addrss \nto Connect to your account",
                  style: Theme.of(context).textTheme.bodyText1,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: height * 0.1,
                ),
              Form(
                key: _formKey,
                child: Column(
                children: [
                    InputTextFormField(
                    controller: emailController,
                    onFieldSubmittedValue: (value) {},
                    onValidator: (value) {
                      return value.isEmpty ? "Enter email" : null;
                    },
                    focusNode: emailFocusNode,
                    hint: "email",
                    keyboardType: TextInputType.emailAddress,
                    obsecureText: false),
                SizedBox(
                  height: height * 0.01,
                ),
                InputTextFormField(
                    controller: passwordController,
                    onFieldSubmittedValue: (value) {},
                    onValidator: (value) {
                      return value.isEmpty ? "Enter password" : null;
                    },

                    focusNode: passwordFocusNode,
                    hint: "password",
                    keyboardType: TextInputType.emailAddress,
                    obsecureText: true),
                 SizedBox(
                  height: height*0.01,
                ),
                ],
              )),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, RouteName.ForgotPassword);
                      },
                      child: Text(
                      "Forgot Password",
                      style: Theme.of(context).textTheme.bodyText1,
                                    ),
                    ),
                  ),
                    SizedBox(
                  height: height*0.03,
                ),
              ChangeNotifierProvider(
                create: (_)=>LoginController(),
                child: Consumer<LoginController>(
                  builder: (context,provider,child){
                    return   RoundButton(
                  title: "Save",
                  onpress: () 
                  {
                    if(_formKey.currentState!.validate()){
                      provider.Login(context,
                       emailController.text.toString(), 
                       passwordController.text.toString()
                       );
                    }
                  },
                  isLoading: provider.isloading,
                  textColor: Colors.black,
                );
                  },
                ),
              ),
                SizedBox(height: height*0.03,),
                InkWell(
                  onTap: (){
                     Navigator.pushNamed(context, RouteName.SignUpPage);
                  },
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                           text: "Don't have an Account? ",
                           style: Theme.of(context).textTheme.bodyText2!.copyWith()
                        ),  TextSpan(
                           text: "SignUp",
                           style: Theme.of(context).textTheme.bodyText1!.copyWith(decoration: TextDecoration.underline)
                        ),
                      ]
                    ),
                    
                  ),
                ),
             
              
              ],
            ),
          ),
        ),
      
      ),
   
    );
  }
}

class ShowMap extends StatefulWidget {
  const ShowMap({super.key});

  @override
  State<ShowMap> createState() => _ShowMapState();
}

class _ShowMapState extends State<ShowMap> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:Column(
        children: [
         
        ],
      )
    );
  }
}


class ShowCalender extends StatelessWidget {
  const ShowCalender({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SfCalendar(
          showNavigationArrow: true,
          headerHeight: 100,
          viewHeaderStyle: ViewHeaderStyle(backgroundColor: Colors.blue),
    view: CalendarView.month,
  ),
    );
  }
}