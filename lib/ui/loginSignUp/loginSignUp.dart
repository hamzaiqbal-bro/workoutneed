import 'package:flutter/material.dart';
import 'package:workour/constants/app_colors.dart';
import 'package:workour/constants/app_styles.dart';
import 'package:workour/constants/imageAssets.dart';
import 'package:workour/constants/stringAssets.dart';
import 'package:workour/widgets/bnuttonWidgets.dart';
import 'package:workour/widgets/formFieldWidget.dart';
import 'package:workour/widgets/imageWidgets.dart';
import 'package:workour/widgets/coustomTextWidgets.dart';

class loginSignUp extends StatefulWidget {
  const loginSignUp({Key? key}) : super(key: key);

  @override
  _loginSignUpState createState() => _loginSignUpState();
}

class _loginSignUpState extends State<loginSignUp> {
  bool signUpLoginCheck = true;
  TextEditingController emial = TextEditingController();

  @override
  Widget build(BuildContext context) {
     double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
              color: AppColors.backgroubdGrye,
              child:  Padding(
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
                      children: [
                        coustomTextWidgets.coustomText(signUpLoginCheck ? 'Login' : 'Sign Up',16.0,AppColors.kPrimaryTwo,FontWeight.bold),
                        SizedBox(height: AppStyles.teennumber,),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: AppColors.kPrimaryTwo,width: 2.0),
                              borderRadius: BorderRadius.circular(10.0)
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap: (){
                                    setState(() {
                                      signUpLoginCheck = true;
                                      print(signUpLoginCheck);
                                    });
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.all(AppStyles.fivenumber),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      gradient: LinearGradient(
                                          begin: FractionalOffset.centerLeft,
                                          end: FractionalOffset.centerRight,
                                          colors: [
                                            signUpLoginCheck ? AppColors.kPrimaryOne.withOpacity(0.8): AppColors.whiteColor,
                                            signUpLoginCheck ?  AppColors.kPrimaryTwo :AppColors.whiteColor,
                                          ],
                                          stops: [
                                            0.0,
                                            0.6
                                          ]),
                                    ),

                                    child:coustomTextWidgets.coustomText(
                                        'Login',14.0,signUpLoginCheck ? AppColors.whiteColor :AppColors.kPrimaryTwo,FontWeight.bold),

                                  ),
                                ),
                              ),
                              Expanded(
                                child: InkWell(
                                  onTap: (){
                                    setState(() {
                                      signUpLoginCheck = false;
                                      print(signUpLoginCheck);
                                    });
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(AppStyles.fivenumber),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      gradient: LinearGradient(
                                          begin: FractionalOffset.centerLeft,
                                          end: FractionalOffset.centerRight,
                                          colors: [
                                            !signUpLoginCheck ? AppColors.kPrimaryOne.withOpacity(0.8): AppColors.whiteColor,
                                            !signUpLoginCheck ?  AppColors.kPrimaryTwo :AppColors.whiteColor,
                                          ],
                                          stops: [
                                            0.0,
                                            0.6
                                          ]),
                                    ),

                                    child:coustomTextWidgets.coustomText(
                                        'Sign Up',14.0,!signUpLoginCheck ? AppColors.whiteColor :AppColors.kPrimaryTwo,FontWeight.bold),

                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: AppStyles.fifteennumber,),
                        imageWidgets.coustomImageWidgets(imageAssets.loginLogo),
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
                        SizedBox(height: AppStyles.fivenumber,),
                        coustomTextWidgets.coustomText( 'Forget Password',16.0,AppColors.backgroubdGrye,FontWeight.bold),
                        SizedBox(height: AppStyles.teennumber,),
                        buttonWidgets.coustomButton('Login',16.0,FontWeight.bold,context),
                      ],
                    ),
                  ),
                ),
              )
          ),
        ),
      ),
    );
  }
}
