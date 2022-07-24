import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'fonts_manager.dart';

TextStyle _getTextStyle(
    double fontSize, FontWeight fontWeight,  Color color) {
  return GoogleFonts.roboto(
      fontWeight: fontWeight,
      fontSize: fontSize,
      color: color);
}

TextStyle getRegularStyle(
    {double fontSize = FontSize.s12, required Color color ,}) {
  return _getTextStyle(
      fontSize, FontWightManager.bold, color
  );
}
// Text light style
TextStyle getLightStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
      fontSize, FontWightManager.light,  color
  );
}
// Text style bold
TextStyle getBoldStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
      fontSize, FontWightManager.bold,  color
  );
}

// Text style semi bold
TextStyle getSemiBoldStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
      fontSize, FontWightManager.semiBold, color
  );
}
// Text style medium
TextStyle getMediumStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
      fontSize, FontWightManager.medium,  color
  );
}
