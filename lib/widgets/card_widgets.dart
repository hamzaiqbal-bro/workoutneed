import 'package:flutter/material.dart';
import 'package:workour/constants/app_colors.dart';
import 'package:workour/widgets/custom_text_widgets.dart';
import 'icon_widgets.dart';

class CardWidgets{
  CardWidgets._();

  static Widget customCardWidget(context, String text, IconData iconData) {
    return Container(
      height: 160.0,
      width: MediaQuery.of(context).size.width / 2.5,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(
              width: 1.0,
              color: Color(0xFFEEEEEE)
          )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconWidgets.customIcon(iconData, AppColors.kPrimaryTwo),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: CustomTextWidgets.centeredText(text, 16.0, AppColors.kPrimaryTwo, FontWeight.w600),
          )
        ],
      ),
    );
  }

}