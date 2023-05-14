import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:tech_media/res/input_textField.dart';
import 'package:tech_media/res/round_button.dart';
import 'package:tech_media/utils/routes/route_name.dart';
import 'package:tech_media/utils/utiles.dart';
import 'package:tech_media/view_model/signup/signup_controller.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();
  final usernameController = TextEditingController();

  final emailFocusNode = FocusNode();

  final passwordFocusNode = FocusNode();
  final usernameFocusNode = FocusNode();
  final _formKey=GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    usernameController.dispose();
    usernameFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(onPressed: (){Get.back();}, icon: Icon(Icons.arrow_back_ios)),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ChangeNotifierProvider(
              create: (_)=>SignupController(),
              child: Consumer<SignupController>(
                builder: (context,provider,child){
                  return SingleChildScrollView(
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
                    "Enter your email addrss \nto register to your account",
                    style: Theme.of(context).textTheme.bodyText1,
                    
                  ),
                  SizedBox(
                    height: height * 0.1,
                  ),
                Form(
                  key: _formKey,
                  child: Column(
                  children: [
                      InputTextFormField(
                      controller: usernameController,
                      onFieldSubmittedValue: (value) {},
                      onValidator: (value) {
                        return value.isEmpty ? "Enter username" : null;
                      },
                      focusNode: usernameFocusNode,
                      hint: "username",
                      keyboardType: TextInputType.emailAddress,
                      obsecureText: false),
                        InputTextFormField(
                      controller: emailController,
                      onFieldSubmittedValue: (value) {
                        Utiles.fieldFocusNode(context, emailFocusNode,passwordFocusNode );
                      },
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
                      onFieldSubmittedValue: (value) {
                        Utiles.fieldFocusNode(context, emailFocusNode, passwordFocusNode);
                      },
                      onValidator: (value) {
                        return value.isEmpty ? "Enter password" : null;
                      },
                      focusNode: passwordFocusNode,
                      hint: "password",
                      keyboardType: TextInputType.emailAddress,
                      obsecureText: true),
                  const SizedBox(
                    height: 10,
                  ),
                  ],
                )),
                  RoundButton(
                    title: "Save",
                    onpress: () {
                      if(_formKey.currentState!.validate()){
                        provider.signUp(context, usernameController.text.toString(), emailController.text, passwordController.text);
                      }
                    },
                    isLoading: provider.isloading,
                    textColor: Colors.black,
                  ),
                  SizedBox(height: height*0.03,),
                  InkWell(
                    onTap: (){
                     Navigator.pushNamed(context, RouteName.LoginPage);
                    },
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                             text: "Already have an Account? ",
                             style: Theme.of(context).textTheme.bodyText2!.copyWith()
                          ),  TextSpan(
                             text: "Login",
                             style: Theme.of(context).textTheme.bodyText1!.copyWith(decoration: TextDecoration.underline)
                          ),
                        ]
                      ),
                      
                    ),
                  )
                ],
              ),
            );
                },
              ),
            )
          ),
        ),
      ),
    );
  }
}
