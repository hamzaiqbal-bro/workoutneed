import 'package:flutter/material.dart';
import 'package:workour/constants/app_colors.dart';
import 'package:workour/widgets/coustomTextWidgets.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width / 1.1,
        color: Colors.white,
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              ListTile(
                leading: Icon(Icons.home,color: AppColors.black[200]),
                title: coustomTextWidgets.coustomText("Add Account", 16.0, AppColors.greyColor, FontWeight.normal),
                trailing: Icon(Icons.arrow_forward_ios,color: AppColors.greyColor),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.settings, color: AppColors.greyColor),
                title: coustomTextWidgets.coustomText("Settings", 16.0, AppColors.greyColor, FontWeight.normal),
                trailing: Icon(Icons.arrow_forward_ios,color: AppColors.greyColor),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.help_center, color: AppColors.black[200]),
                title: coustomTextWidgets.coustomText("Help Center", 16.0, AppColors.greyColor, FontWeight.normal),
                trailing: Icon(Icons.arrow_forward_ios,color: AppColors.greyColor),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.logout, color: AppColors.black[200]),
                title: coustomTextWidgets.coustomText("Logout", 16.0, AppColors.greyColor, FontWeight.normal),
                trailing: Icon(Icons.arrow_forward_ios,color: AppColors.greyColor),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ]
          ),
        )
      ),
    );
  }
}
