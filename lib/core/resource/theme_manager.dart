import 'package:flutter/material.dart';
import 'package:odc_hackathon_web_project/core/resource/style_manager.dart';
import 'package:odc_hackathon_web_project/core/resource/value_manager.dart';
import '../constant/custom_color.dart';
import 'color_manager.dart';
import 'fonts_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
      // main colors of the app
      primaryColor: ColorManager.primary,
      primarySwatch: createMaterialColor(ColorManager.primary),
      scaffoldBackgroundColor: ColorManager.backGround,

      // button theme
      buttonTheme: const ButtonThemeData(
        shape: StadiumBorder(),
        disabledColor: ColorManager.disableTextColor,
        buttonColor: ColorManager.primary,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: ColorManager.backGround,
        elevation: 0,
        iconTheme: IconThemeData(
          color: ColorManager.appBar
        ),
          centerTitle: true
      ),
      // elevatedButtonTheme
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
        textStyle: getSemiBoldStyle(
            color: ColorManager.whiteColor, fontSize: AppSize.s12),
        fixedSize: const Size(208, 62),
        shadowColor: Colors.transparent.withOpacity(0.1),
        primary: ColorManager.primary,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s8)),
      )),
      // text theme
      textTheme: TextTheme(
        headline1: getSemiBoldStyle(
            color: ColorManager.headTextColor, fontSize: AppSize.s16),
        subtitle1: getLightStyle(
            color: ColorManager.captionTextColor, fontSize: FontSize.s14),
        bodyText1: getRegularStyle(color: ColorManager.headTextColor),
      ),
      // input decoration theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: ColorManager.backGroundField,
        // contentPadding: const EdgeInsets.all(AppPadding.p8),
        // hit style
        hintStyle: getRegularStyle(color: ColorManager.captionTextColor),
        // label style
        labelStyle: getMediumStyle(color: ColorManager.disableTextColor),
        // error style
        errorStyle: getRegularStyle(color: ColorManager.error),
        //enable border
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s10)),
        ),
        //Focused border
        focusedBorder: const OutlineInputBorder(
          borderSide:
              BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
        ),
        // error Border
        errorBorder: const OutlineInputBorder(
          borderSide:
              BorderSide(color: ColorManager.error, width: AppSize.s1_5),
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
        ),
        // focused error
        focusedErrorBorder: const OutlineInputBorder(
          borderSide:
              BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
        ),
      ));
}
