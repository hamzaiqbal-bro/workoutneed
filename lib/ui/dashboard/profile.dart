import 'package:flutter/material.dart';
//import 'package:flutter_svg/svg.dart';
import 'package:workour/constants/app_colors.dart';
import 'package:workour/constants/imageAssets.dart';
import 'package:workour/widgets/customTextWidgets.dart';
import 'package:workour/widgets/decoratedContainerWidgets.dart';
import 'package:workour/widgets/iconWidgets.dart';
import 'package:workour/widgets/imageWidgets.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1.0,
        title: CustomTextWidgets.appBarTextWidget("Profile"),
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
              Container(
                  padding: EdgeInsets.all(10.0),
                  color: AppColors.defaultColor,
                  child: Row(
                    children: [
                      ImageWidgets.circularImage(imageAssets.profileImage, 80.0, 80.0),
                      SizedBox(width: 5.0),
                      CustomTextWidgets.customText("John Doe", 16.0, AppColors.kPrimaryTwo, FontWeight.w600),
                      Spacer(),
                      DecoratedContainerWidgets.decoratedContainer("Change Picture", Icons.camera_alt, AppColors.kPrimaryTwo)
                    ],
                  )
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(15.0),
                color: Colors.white,
                child: CustomTextWidgets.customText('Login and Security', 18.0, AppColors.kPrimaryTwo, FontWeight.bold),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(10.0),
                color: AppColors.defaultColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          child: Column(
                            children: [
                              CustomTextWidgets.customText("Username", 16.0, Colors.black, FontWeight.w600),
                              CustomTextWidgets.customText("@Johndoe", 16.0, AppColors.greyColor, FontWeight.normal),
                            ],
                          ),
                        ),
                        Spacer(),
                        DecoratedContainerWidgets.decoratedContainer("Edit Data", Icons.edit, AppColors.kPrimaryTwo)
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextWidgets.customText("Email", 16.0, Colors.black, FontWeight.w600),
                          CustomTextWidgets.customText("johndoe123@gmail.com", 16.0, AppColors.greyColor, FontWeight.normal),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextWidgets.customText("Phone Number", 16.0, Colors.black, FontWeight.w600),
                          CustomTextWidgets.customText("+923455678890", 16.0, AppColors.greyColor, FontWeight.normal),
                        ],
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
                        child: CustomTextWidgets.customText("Password", 16.0, Colors.black, FontWeight.w600)),
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
                        child: CustomTextWidgets.customText("Security", 16.0, Colors.black, FontWeight.w600)),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(15.0),
                color: Colors.white,
                child: CustomTextWidgets.customText('General', 18.0, AppColors.kPrimaryTwo, FontWeight.bold),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(10.0),
                color: AppColors.defaultColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
                        child: CustomTextWidgets.customText("Data Usage", 16.0, Colors.black, FontWeight.w600)),
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
                        child: CustomTextWidgets.customText("App Data", 16.0, Colors.black, FontWeight.w600)),
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
                        child: CustomTextWidgets.customText("About Workoutneed", 16.0, Colors.black, FontWeight.w600)),
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
                        child: CustomTextWidgets.customText("Logout", 16.0, AppColors.kPrimaryTwo, FontWeight.w600)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
