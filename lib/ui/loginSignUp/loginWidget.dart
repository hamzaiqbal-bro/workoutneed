import 'package:flutter/material.dart';
import 'package:workour/constants/app_colors.dart';
import 'package:workour/constants/app_styles.dart';
import 'package:workour/constants/imageAssets.dart';
import 'package:workour/ui/dashboard/dash_board.dart';
import 'package:workour/ui/dashboard/home_body.dart';
import 'package:workour/ui/loginSignUp/forgetScreen.dart';
import 'package:workour/widgets/bnuttonWidgets.dart';
import 'package:workour/widgets/formFieldWidget.dart';
import 'package:workour/widgets/imageWidgets.dart';
import 'package:workour/widgets/customTextWidgets.dart';

class loginWidget extends StatefulWidget {
  const loginWidget({Key? key}) : super(key: key);

  @override
  _loginWidgetState createState() => _loginWidgetState();
}

class _loginWidgetState extends State<loginWidget> {
  TextEditingController emial = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ImageWidgets.customImageWidgets(imageAssets.loginLogo),
        SizedBox(height: AppStyles.fifteennumber,),
        InputField(
            'next',
            'Enter Email',
            'Email',
            Icons.email,
            emial,
            TextInputType.emailAddress,
            true
        ),

        SizedBox(height: AppStyles.teennumber,),

        InputField(
            'next',
            'Enter Password',
            'Password',
            Icons.lock,
            emial,
            TextInputType.visiblePassword,
            true
        ),
        SizedBox(height: AppStyles.teennumber,),
        Align(
            alignment: Alignment.centerRight,
            child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => forgetScreen()));
                },
                child: CustomTextWidgets.customText( 'Forget Password',16.0,AppColors.backgroubdGrye,FontWeight.bold))),
        SizedBox(height: AppStyles.fifteennumber,),
        InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => DashBoard()));
            },
            child: ButtonWidgets.coustomButton('Login',16.0,FontWeight.bold,context)),
        SizedBox(height: AppStyles.fourtynumber,),
        Align(
            alignment: Alignment.center,
            child: CustomTextWidgets.customText( 'OR',19.0,AppColors.backgroubdGrye,FontWeight.bold)),
        SizedBox(height: AppStyles.thirtynumber,),

        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageWidgets.customImageWidgets(imageAssets.googleIcon),
            SizedBox(width: AppStyles.tweentynumber,),
            ImageWidgets.customImageWidgets(imageAssets.twitterIcon),
            SizedBox(width: AppStyles.tweentynumber,),
            ImageWidgets.customImageWidgets(imageAssets.facebookIcon),
          ],
        ),
        SizedBox(height: AppStyles.teennumber,),
      ],
    );
  }
}
