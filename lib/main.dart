
import 'package:flutter/material.dart';

import 'Authentication/View/login_screen.dart';


main()  {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(Home());
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(),
    );
  }
}
