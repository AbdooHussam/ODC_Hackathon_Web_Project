import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'Authentication/View/login_screen.dart';
import 'Authentication/View/registerScreen.dart';
import 'Authentication/auth_cubit.dart';
import 'Home/View/Home_screen.dart';
import 'core/BlocObserver.dart';
import 'core/resource/route_manager.dart';

main() {
  WidgetsFlutterBinding.ensureInitialized();
  BlocOverrides.runZoned(
    () {
      runApp(Home());
      // Use cubits...
    },
    blocObserver: MyBlocObserver(),
  );

}


class Home extends StatelessWidget {
  static const String title = 'GoRouter Example: Declarative Routes';

  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (BuildContext context) => AuthCubit(),
        ),
      ],

      child: MaterialApp.router(
        theme: ThemeData.light(),
        debugShowCheckedModeBanner: false,
        routeInformationProvider: _router.routeInformationProvider,
        routeInformationParser: _router.routeInformationParser,
        routerDelegate: _router.routerDelegate,
        title: title,
      ),
    );

  }
  final GoRouter _router = GoRouter(
    urlPathStrategy: UrlPathStrategy.path,
    initialLocation: '/LoginScreen',
    routes: <GoRoute>[
      GoRoute(
        path: '/LoginScreen',
        builder: (BuildContext context, GoRouterState state) =>
            BlocProvider<AuthCubit>(
              create: (context) => AuthCubit(),
              child: LoginScreen(),
            ),
      ),
      GoRoute(
        path: '/homescreen',
        builder: (BuildContext context, GoRouterState state) =>
        const HomeScreen(),
      ),

      GoRoute(
        path: '/SignUp',
        builder: (BuildContext context, GoRouterState state) =>
        const RegisterScreen(),
      ),
    ],
  );
}
