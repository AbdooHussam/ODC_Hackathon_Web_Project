// import 'package:flutter/material.dart';
//
// class SizeConfig {
//   static MediaQueryData? _mediaQueryData;
//   static double? screenWidth;
//   static double? screenHeight;
//   static double? defaultSize;
//
//   // static Orientation? orientation;
//
//   void init(BuildContext context) {
//     _mediaQueryData = MediaQuery.of(context);
//     screenWidth = _mediaQueryData!.size.width;
//     screenHeight = _mediaQueryData!.size.height;
//     // orientation = _mediaQueryData!.orientation;
//   }
// }
//
// // Get the proportionate height as per screen size
// double getScreenHeight(double inputHeight) {
//   double? screenHeight = SizeConfig.screenHeight;
//   // 812 is the layout height that designer use
//   double height= double.parse("0.${inputHeight.toInt()}");
//   print("$height hhhhhhhhhhhhhhhhhhhhhhhhhhhhh");
//   return screenHeight! * height ;
// }
//
// // Get the proportionate height as per screen size
// double getScreenWidth(double inputWidth) {
//   double? screenWidth = SizeConfig.screenWidth;
//   // 375 is the layout width that designer use
//   double width= double.parse("0.${inputWidth.toInt()}");
//   print("$width wwwwwwwwwwwwwwwwwwwwwwwwwww");
//   return  screenWidth! * width ;
// }
