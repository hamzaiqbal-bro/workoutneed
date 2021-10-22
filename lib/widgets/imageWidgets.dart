
import 'package:flutter/material.dart';
import 'package:workour/constants/app_colors.dart';

class imageWidgets{
  imageWidgets._();

  static Widget coustomImageWidgets(String imagePath) {
    return Image.asset(imagePath);
  }


  static Widget circularImage(String imagePath, double _height, double _width) {
    return ClipOval(
        child: Image.asset(
          imagePath,
          height: _height,
          width: _width,
          fit: BoxFit.cover
        )
    );
  }

  static Widget circleAvatar(String imagePath, double innerRadius, double outerRadius) {
    return CircleAvatar(
      child: CircleAvatar(
        backgroundColor: Colors.white,
        backgroundImage: AssetImage(imagePath),
        radius: innerRadius,
      ),
      radius: outerRadius,
      backgroundColor: AppColors.kPrimaryTwo,
    );
  }
}