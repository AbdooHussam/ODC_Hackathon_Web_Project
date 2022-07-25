import 'package:flutter/material.dart';
Column divider() {
  return Column(children: [
    Row(children:[
      Expanded(
        child:  Container(
            margin:  EdgeInsets.only(left: 10.0, right: 20.0),
            child: const Divider(
              color: Colors.black,
            )),
      ),
      Text("OR"),
      Expanded(
        child:  Container(
            margin:  const EdgeInsets.only(left: 20.0, right: 10.0),
            child: const Divider(
              color: Colors.black,
            )),
      ),
    ]),

  ]);
}