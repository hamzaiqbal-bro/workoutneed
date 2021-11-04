import 'package:flutter/material.dart';
import 'package:workour/constants/app_colors.dart';
import 'package:workour/widgets/custom_text_widgets.dart';
import 'package:workour/widgets/icon_widgets.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1.0,
        title: CustomTextWidgets.appBarTextWidget("Settings"),
        centerTitle: true,
        leading: IconButton(
          icon: IconWidgets.customIcon(Icons.arrow_back, AppColors.kPrimaryTwo),
          onPressed: () => Navigator.pop(context, false),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Divider(
                thickness: 1.5,
                indent: 0,
                endIndent: 0,
                color: AppColors.backgroundGrey,
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                //color: Colors.white,
                child: CustomTextWidgets.customText('Account', 16.0, Colors.black, FontWeight.w600),
              ),
              Divider(
                thickness: 1.5,
                indent: 0,
                endIndent: 0,
                color: AppColors.backgroundGrey,
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                //color: Colors.white,
                child: CustomTextWidgets.customText('Video Quality', 16.0, Colors.black, FontWeight.w600),
              ),
              Divider(
                thickness: 1.5,
                indent: 0,
                endIndent: 0,
                color: AppColors.backgroundGrey,
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                //color: Colors.white,
                child: CustomTextWidgets.customText('History & Privacy', 16.0, Colors.black, FontWeight.w600),
              ),
              Divider(
                thickness: 1.5,
                indent: 0,
                endIndent: 0,
                color: AppColors.backgroundGrey,
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
