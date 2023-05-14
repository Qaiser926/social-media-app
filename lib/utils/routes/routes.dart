import 'package:flutter/material.dart';
import 'package:tech_media/utils/routes/route_name.dart';
import 'package:tech_media/view/dashboard/dashboardScreen.dart';
import 'package:tech_media/view/forgot_password/forgotPassword.dart';
import 'package:tech_media/view/home/home.dart';
import 'package:tech_media/view/login/login_screen.dart';
import 'package:tech_media/view/signup/sign_up_screen.dart';
import 'package:tech_media/view/splash/splash_screen.dart';


class Routes {

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case RouteName.splashScreen:

        return MaterialPageRoute(builder: (_) =>  SplashScreen());
         case RouteName.HomePage:
        return MaterialPageRoute(builder: (_) => const HomePage());

         case RouteName.LoginPage:
        return MaterialPageRoute(builder: (_) =>  LoginPage());

        case RouteName.SignUpPage:
        return MaterialPageRoute(builder: (_) =>  SignUpPage());
        case RouteName.DashBoardScreen:
        return MaterialPageRoute(builder: (_) =>  DashBoardScreen());
 case RouteName.ForgotPassword:
        return MaterialPageRoute(builder: (_) =>  ForgotPassword());


      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          );
        });
    }
  }
}