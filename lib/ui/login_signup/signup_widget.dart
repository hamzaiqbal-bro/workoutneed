import 'package:flutter/material.dart';
import 'package:workour/constants/app_colors.dart';
import 'package:workour/constants/app_styles.dart';
import 'package:workour/constants/image_assets.dart';
import 'package:workour/widgets/button_widgets.dart';
import 'package:workour/widgets/form_field_widget.dart';
import 'package:workour/widgets/image_widgets.dart';
import 'package:workour/widgets/custom_text_widgets.dart';

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({Key? key}) : super(key: key);

  @override
  _SignUpWidgetState createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {

  TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        InputField(
            'next',
            'Enter Username',
            'Username',
            Icons.account_circle_outlined,
            email,
            TextInputType.emailAddress,
            true
        ),

        SizedBox(height: AppStyles.teennumber,),
        InputField(
            'next',
            'Enter Email',
            'Email',
            Icons.email,
            email,
            TextInputType.emailAddress,
            true
        ),

        SizedBox(height: AppStyles.teennumber,),

        InputField(
            'next',
            'Enter Password',
            'Password',
            Icons.remove_red_eye,
            email,
            TextInputType.visiblePassword,
            true
        ),
        SizedBox(height: AppStyles.teennumber,),

        InputField(
            'next',
            'confirm password',
            'confirm password',
            Icons.remove_red_eye,
            email,
            TextInputType.visiblePassword,
            true
        ),
        SizedBox(height: AppStyles.teennumber,),
        Align(
            alignment: Alignment.centerRight,
            child: CustomTextWidgets.customText( 'Forget Password',16.0,AppColors.backgroundGrey,FontWeight.bold)),
        SizedBox(height: AppStyles.fifteennumber,),

        ButtonWidgets.coustomButton('Login',16.0,FontWeight.bold,context),
        SizedBox(height: AppStyles.fourtynumber,),
        Align(
            alignment: Alignment.center,
            child: CustomTextWidgets.customText( 'OR',19.0,AppColors.backgroundGrey,FontWeight.bold)),
        SizedBox(height: AppStyles.thirtynumber,),

        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageWidgets.customImageWidgets(ImageAssets.googleIcon),
            SizedBox(width: AppStyles.tweentynumber,),
            ImageWidgets.customImageWidgets(ImageAssets.twitterIcon),
            SizedBox(width: AppStyles.tweentynumber,),
            ImageWidgets.customImageWidgets(ImageAssets.facebookIcon),
          ],
        ),
        SizedBox(height: AppStyles.teennumber,),
      ],
    );
  }
}
