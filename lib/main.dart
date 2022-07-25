import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'Authentication/View/login_screen.dart';
import 'Home/View/Home_screen.dart';

main() {
  WidgetsFlutterBinding.ensureInitialized();
  // BlocOverrides.runZoned(
  //   () {
  //     // Use cubits...
  //   },
  //   blocObserver: MyBlocObserver(),
  // );
  runApp(Home());
}


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
