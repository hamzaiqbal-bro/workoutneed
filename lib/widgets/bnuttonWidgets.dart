import 'package:flutter/material.dart';
import 'package:workour/constants/app_colors.dart';
import 'package:workour/constants/app_styles.dart';
import 'package:workour/widgets/customTextWidgets.dart';

import 'iconWidgets.dart';

class ButtonWidgets{
  ButtonWidgets._();

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
      child: CustomTextWidgets.customText(text, fontSize, AppColors.whiteColor, fontWeight) ,
    );
  }

  static Widget darkGreyButton(String text, double fontSize, FontWeight fontWeight, context) {
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
              Colors.black54,
              Colors.black54,
            ],
            stops: [
              0.0,
              0.6
            ]),
      ),
      child: CustomTextWidgets.customText(text, fontSize, AppColors.whiteColor, fontWeight) ,
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
          CustomTextWidgets.customText(text, fontSize, AppColors.whiteColor, fontWeight)
        ],
      )

    );
  }

  static Widget whiteTextButton(String text, double fontSize, FontWeight fontWeight,context) {
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
              AppColors.whiteColor.withOpacity(0.8),
              AppColors.whiteColor ,
            ],
            stops: [
              0.0,
              0.6
            ]),

        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: CustomTextWidgets.customText(text, fontSize, AppColors.darkBlack, fontWeight) ,
    );
  }

}