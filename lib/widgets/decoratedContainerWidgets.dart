import 'package:flutter/material.dart';
import 'package:workour/constants/app_colors.dart';
import 'package:workour/widgets/coustomTextWidgets.dart';
import 'iconWidgets.dart';

class DecoratedContainerWidgets{
  DecoratedContainerWidgets._();

  static Widget decoratedContainer(Widget child) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      decoration: new BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: AppColors.kPrimaryTwo, spreadRadius: 1.5),
        ],
      ),
      child: child,
    );
  }

}