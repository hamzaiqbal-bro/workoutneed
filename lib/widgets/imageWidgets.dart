import 'package:flutter/material.dart';
import 'package:workour/constants/app_colors.dart';

class ImageWidgets{
  ImageWidgets._();

  static Widget customImageWidgets(String imagePath) {
    return Image.asset(imagePath);
  }

  static Widget imageWidget(String imagePath, BoxFit boxFit) {
    return Image.asset(imagePath, fit: boxFit);
  }

  static Widget coustomImageWithHeightWidthWidgets(String imagePath,height,width) {
    return Image.asset(imagePath,height: height,width: width,);
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

  static Widget circularAvatar(IconData iconData, Color iconColor, double innerRadius, double outerRadius, Color innerBgColor, Color outerBgColor) {
    return CircleAvatar(
      child: CircleAvatar(
        backgroundColor: innerBgColor,
        radius: innerRadius,
        child: Icon(iconData, size: 35.0, color: iconColor,),
      ),
      radius: outerRadius,
      backgroundColor: outerBgColor,
    );
  }

}