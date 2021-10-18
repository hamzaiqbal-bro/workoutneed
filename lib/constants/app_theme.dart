import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'font_family.dart';

final ThemeData themeData = new ThemeData(
    fontFamily: FontFamily.kFontPoppinsRegular,
    primaryColor: AppColors.kPrimaryTwo,

    accentColorBrightness: Brightness.light,

  textTheme: const TextTheme(
      bodyText2: TextStyle(color: AppColors.kPrimaryTwo),
      bodyText1: TextStyle(color: AppColors.kPrimaryTwo,fontSize: 20.0,fontWeight: FontWeight.bold)),

    buttonTheme: ButtonThemeData( // 4
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      buttonColor: AppColors.kPrimaryTwo,
    ),

     backgroundColor: AppColors.kPrimaryTwo,
    scaffoldBackgroundColor: Colors.white,


);


