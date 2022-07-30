import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
class FaceBook extends StatefulWidget {
   FaceBook({ required this.queryAuth});
String ? queryAuth;
  @override
  State<FaceBook> createState() => _FaceBookState();

}

class _FaceBookState extends State<FaceBook> {
  @override
  Timer?_timer;
  _startDelay(){
    _timer = Timer( const Duration(
        microseconds: 20
    ),
        _goNext

    );
  }
  _goNext()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("accessToken", widget.queryAuth!);
    if (kDebugMode) {
      print(prefs.getString('accessToken'));
    }
    context.replace('/HomeScreen');
  }
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    _timer?.cancel();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(widget.queryAuth!),
    );
  }
}
