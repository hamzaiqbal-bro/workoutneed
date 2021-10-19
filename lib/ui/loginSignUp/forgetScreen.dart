import 'package:flutter/material.dart';
import 'package:workour/constants/app_colors.dart';
import 'package:workour/constants/app_styles.dart';
import 'package:workour/ui/loginSignUp/confirmResetPassword.dart';
import 'package:workour/widgets/coustomTextWidgets.dart';
import 'package:workour/widgets/formFieldWidget.dart';
import 'package:workour/widgets/bnuttonWidgets.dart';


class forgetScreen extends StatefulWidget {
  const forgetScreen({Key? key}) : super(key: key);

  @override
  _forgetScreenState createState() => _forgetScreenState();
}

class _forgetScreenState extends State<forgetScreen> {
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
                      Expanded(child: coustomTextWidgets.coustomText('Reset Password',19.0,AppColors.kPrimaryTwo,FontWeight.bold)),
                      Expanded(child: Column(
                        children: [
                          InputField(
                              'next',
                              'Enter Email',
                              'Email',
                              Icons.email,
                              emial,
                              TextInputType.emailAddress,
                              true
                          ),

                          SizedBox(height: AppStyles.fifteennumber,),
                          InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => confirmResetPassword()));
                              },
                              child: buttonWidgets.coustomButton('Send Code',16.0,FontWeight.bold,context)),
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
