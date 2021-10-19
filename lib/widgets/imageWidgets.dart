
import 'package:flutter/material.dart';

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
}