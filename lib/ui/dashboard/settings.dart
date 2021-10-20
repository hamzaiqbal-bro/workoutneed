import 'package:flutter/material.dart';
import 'package:workour/constants/app_colors.dart';
import 'package:workour/widgets/coustomTextWidgets.dart';
import 'package:workour/widgets/iconWidgets.dart';

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
        title: Text("Settings", style: TextStyle(color: AppColors.kPrimaryTwo, fontWeight: FontWeight.bold),),
        centerTitle: true,
        leading: IconButton(
          icon: IconWidgets.customIcon(Icons.arrow_back, AppColors.kPrimaryTwo),
          onPressed: () => Navigator.pop(context, false),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Divider(
                thickness: 1.5,
                indent: 0,
                endIndent: 0,
                color: AppColors.backgroubdGrye,
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                //color: Colors.white,
                child: coustomTextWidgets.coustomText('Account', 16.0, Colors.black, FontWeight.w600),
              ),
              Divider(
                thickness: 1.5,
                indent: 0,
                endIndent: 0,
                color: AppColors.backgroubdGrye,
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                //color: Colors.white,
                child: coustomTextWidgets.coustomText('Video Quality', 16.0, Colors.black, FontWeight.w600),
              ),
              Divider(
                thickness: 1.5,
                indent: 0,
                endIndent: 0,
                color: AppColors.backgroubdGrye,
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                //color: Colors.white,
                child: coustomTextWidgets.coustomText('History & Privacy', 16.0, Colors.black, FontWeight.w600),
              ),
              Divider(
                thickness: 1.5,
                indent: 0,
                endIndent: 0,
                color: AppColors.backgroubdGrye,
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
