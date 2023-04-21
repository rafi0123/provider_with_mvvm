import 'package:flutter/material.dart';
import 'package:mvvm_with_provider/utils/routes/routes_name.dart';
import 'package:mvvm_with_provider/view/home_view.dart';
import 'package:mvvm_with_provider/view/login_view.dart';
import 'package:mvvm_with_provider/view/signup_view.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.home:
        return MaterialPageRoute(builder: (context) => const HomeView());
         case RoutesName.login:
        return MaterialPageRoute(builder: (context) => const LoginView());
        case RoutesName.signup:
        return MaterialPageRoute(builder: (context) => const SignUpView());
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: SafeArea(
                child: Center(
              child: Text('No route found'),
            )),
          );
        });
    }
  }
}
