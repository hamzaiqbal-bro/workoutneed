import 'package:flutter/material.dart';
import 'package:workour/constants/app_colors.dart';
import 'package:workour/constants/app_styles.dart';
import 'package:workour/widgets/coustomTextWidgets.dart';

import 'iconWidgets.dart';

class buttonWidgets{
  buttonWidgets._();

  static Widget coustomButton(String text, double fontSize, FontWeight fontWeight,context) {
    return Container(
      height: 50.0,
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      padding: EdgeInsets.all(AppStyles.fivenumber),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        gradient: LinearGradient(
            begin: FractionalOffset.centerLeft,
            end: FractionalOffset.centerRight,
            colors: [
              AppColors.kPrimaryOne.withOpacity(0.8),
                AppColors.kPrimaryTwo ,
            ],
            stops: [
              0.0,
              0.6
            ]),
      ),
      child:coustomTextWidgets.coustomText(text, fontSize, AppColors.whiteColor, fontWeight) ,
    );
  }

  static Widget customIconTextButton(String text, double fontSize, FontWeight fontWeight, IconData iconData, context) {
    return Container(
      height: 50.0,
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      padding: EdgeInsets.all(AppStyles.fivenumber),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        gradient: LinearGradient(
            begin: FractionalOffset.centerLeft,
            end: FractionalOffset.centerRight,
            colors: [
              AppColors.kPrimaryOne.withOpacity(0.8),
                AppColors.kPrimaryTwo ,
            ],
            stops: [
              0.0,
              0.6
            ]),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconWidgets.sizedIcon(iconData, Colors.white, 30.0),
          SizedBox(width: 10.0),
          coustomTextWidgets.coustomText(text, fontSize, AppColors.whiteColor, fontWeight)
        ],
      )
    );
  }

}