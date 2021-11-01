import 'package:flutter/material.dart';
import 'package:workour/constants/app_colors.dart';
import 'package:workour/constants/app_styles.dart';
import 'package:workour/ui/loginSignUp/confirmResetPassword.dart';
import 'package:workour/ui/loginSignUp/loginSignUp.dart';
import 'package:workour/widgets/customTextWidgets.dart';
import 'package:workour/widgets/formFieldWidget.dart';
import 'package:workour/widgets/bnuttonWidgets.dart';

class newPasswordScreen extends StatefulWidget {
  const newPasswordScreen({Key? key}) : super(key: key);

  @override
  _newPasswordScreenState createState() => _newPasswordScreenState();
}

class _newPasswordScreenState extends State<newPasswordScreen> {
  TextEditingController emial = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: AppColors.backgroubdGrye,
          alignment: Alignment.center,
          child:   Padding(
            padding: EdgeInsets.all(AppStyles.teennumber),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(20.0),
              ),
              width: width,
              child: Padding(
                padding: EdgeInsets.all(AppStyles.fifteennumber),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: CustomTextWidgets.customText('Reset Password',19.0,AppColors.kPrimaryTwo,FontWeight.bold)),
                    Expanded(child: Column(
                      children: [
                        InputField(
                            'next',
                            'Enter password',
                            'password',
                            Icons.remove_red_eye,
                            emial,
                            TextInputType.emailAddress,
                            true
                        ),

                        SizedBox(height: AppStyles.fifteennumber,),

                        InputField(
                            'next',
                            'confirm password',
                            'confirm Password',
                            Icons.remove_red_eye,
                            emial,
                            TextInputType.emailAddress,
                            true
                        ),

                        SizedBox(height: AppStyles.fifteennumber,),
                        InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => loginSignUp()));
                            },
                            child: ButtonWidgets.coustomButton('Change Password',16.0,FontWeight.bold,context)),
                      ],
                    ),)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
