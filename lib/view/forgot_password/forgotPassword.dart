import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:tech_media/res/input_textField.dart';
import 'package:tech_media/res/round_button.dart';
import 'package:tech_media/utils/routes/route_name.dart';
import 'package:tech_media/view_model/forgot_password/forgot_password_controller.dart';
import 'package:tech_media/view_model/login_controller/loginController.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
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
        appBar: AppBar(

          elevation: 0,
          title: Text(""),
        ),
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
                  "Forgot Password ",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontSize: 18),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Text(
                  "Enter your email addrss \nto recover your password",
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
              
                ],
              )),
                
                    SizedBox(
                  height: height*0.03,
                ),
              ChangeNotifierProvider(
                create: (_)=>ForgotController(),
                child: Consumer<ForgotController>(
                  builder: (context,provider,child){
                    return   RoundButton(
                  title: "Recover Password", 
                  onpress: () 
                  {
                    if(_formKey.currentState!.validate()){
                      provider.forgotPassword(context,
                       emailController.text.toString(),
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
             
              
              ],
            ),
          ),
        ),
      
      ),
   
    );
  }
}