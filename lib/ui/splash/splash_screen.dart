import 'dart:async';
import 'package:workour/ui/login_signup/login_signup.dart';
import 'package:flutter/material.dart';
import 'package:workour/constants/app_colors.dart';
import 'package:workour/constants/image_assets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 5),
            () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginSignUp())));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
                colors: [
                  AppColors.kPrimaryOne.withOpacity(0.8),
                  AppColors.kPrimaryTwo,
                ],
                stops: [
                  0.0,
                  0.7
                ]),
        ),
        child: Image.asset(ImageAssets.applogo,
        ),
      ),
    );
  }
}
