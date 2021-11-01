import 'package:flutter/material.dart';
import 'package:workour/constants/app_colors.dart';
import 'package:workour/constants/app_styles.dart';
import 'package:workour/ui/loginSignUp/loginWidget.dart';
import 'package:workour/ui/loginSignUp/signUpWidget.dart';
import 'package:workour/widgets/customTextWidgets.dart';

class loginSignUp extends StatefulWidget {
  const loginSignUp({Key? key}) : super(key: key);

  @override
  _loginSignUpState createState() => _loginSignUpState();
}

class _loginSignUpState extends State<loginSignUp> {
  bool signUpLoginCheck = true;


  @override
  Widget build(BuildContext context) {
     double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
            color: AppColors.backgroubdGrye,
            alignment: Alignment.center,
            child:  SingleChildScrollView(
              child: Padding(
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
                        CustomTextWidgets.customText(signUpLoginCheck ? 'Login' : 'Sign Up',16.0,AppColors.kPrimaryTwo,FontWeight.bold),
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

                                    child:CustomTextWidgets.customText(
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

                                    child:CustomTextWidgets.customText(
                                        'Sign Up',14.0,!signUpLoginCheck ? AppColors.whiteColor :AppColors.kPrimaryTwo,FontWeight.bold),

                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: AppStyles.fourtynumber,),
                        signUpLoginCheck  ?  loginWidget() : signUpWidget(),
                      ],
                    ),
                  ),
                ),
              ),
            )
        ),
      ),
    );
  }
}
