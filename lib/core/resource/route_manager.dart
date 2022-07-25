import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_hackathon_web_project/Home/View/Home_screen.dart';

import '../../Authentication/View/login_screen.dart';
import '../../Authentication/auth_cubit.dart';

class Routes {
  static const String loginRoute = "/LoginScreen";
  static const String homeScreen = "/HomeScreen";


}


class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (context) =>
            BlocProvider<AuthCubit>(
              create: (context) => AuthCubit(),
              child: LoginScreen(),
            ));
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (context) =>
            BlocProvider<AuthCubit>(
              create: (context) => AuthCubit(),
              child: HomeScreen(),
            ));


      default:
        return unDefinedRoute();
    }
  }

  static Route unDefinedRoute() =>
      MaterialPageRoute(
          builder: (context) =>
              Scaffold(
                appBar: AppBar(
                  // title: Text(AppString.undefinedRoute),
                ),
                body: const Center(
                  // child:Text(AppString.undefinedRoute),
                ),
              ));
}
