import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:workour/constants/app_colors.dart';
import 'package:workour/constants/font_family.dart';
import 'package:workour/widgets/coustomTextWidgets.dart';

customAlert(context,text){
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context){
        return StatefulBuilder(
            builder: (context, setState){
              return Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 5.0,
                backgroundColor: AppColors.whiteColor,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            coustomTextWidgets.myCustomText(
                                "Alert Message",
                                16.0,
                                AppColors.kPrimaryTwo,
                                FontWeight.bold),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),

                        coustomTextWidgets.myCustomText(
                            text.toString(),
                            16.0,
                            AppColors.kPrimaryTwo,
                            FontWeight.normal),

                        SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: AppColors.kPrimaryTwo,
                                  borderRadius: const BorderRadius.all(Radius.circular(5000.0))),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  splashColor: AppColors.kPrimaryOne,
                                  borderRadius: const BorderRadius.all(Radius.circular(5000.0)),
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 12, bottom: 12, left: 18, right: 18),
                                    child: Center(
                                      child: coustomTextWidgets.myCustomText(
                                          "OK",
                                          16.0,
                                          AppColors.whiteColor,
                                          FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            }
        );
      });
}



waitingdialouge(context,text){
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context){
        return StatefulBuilder(
            builder: (context, setState){
              return Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 5.0,
                backgroundColor: AppColors.whiteColor,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        SpinKitFadingFour(
                          itemBuilder: (BuildContext context, int index) {
                            return DecoratedBox(
                              decoration: BoxDecoration(
                                color: AppColors.kPrimaryTwo,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
        );
      });
}