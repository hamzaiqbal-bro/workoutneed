import 'package:flutter/material.dart';
import 'package:workour/constants/app_colors.dart';
import 'package:workour/widgets/custom_text_widgets.dart';
import 'package:workour/widgets/icon_widgets.dart';

class HelpAndSupport extends StatefulWidget {
  const HelpAndSupport({Key? key}) : super(key: key);

  @override
  _HelpAndSupportState createState() => _HelpAndSupportState();
}

class _HelpAndSupportState extends State<HelpAndSupport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1.0,
        title: CustomTextWidgets.appBarTextWidget("Support"),
        centerTitle: true,
        leading: IconButton(
          icon: IconWidgets.customIcon(Icons.arrow_back, AppColors.kPrimaryTwo),
          onPressed: () => Navigator.pop(context, false),
        ),
      ),
      backgroundColor: AppColors.backgroundGrey,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: Colors.white,
                ),
                child: TextField(
                  cursorColor: AppColors.kPrimaryTwo,
                  decoration: InputDecoration(
                      hintText: " Search here...",
                      border: InputBorder.none,
                      prefixIcon: IconButton(
                        icon: Icon(Icons.search),
                        color: Color.fromRGBO(93, 25, 72, 1),
                        onPressed: () {},
                      ),
                  ),
                  style: TextStyle(color: Colors.black, fontSize: 15.0),
                ),
              ),
              Divider(
                thickness: 1,
                indent: 0,
                endIndent: 0,
                color: Colors.white,
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                //color: Colors.white,
                child: CustomTextWidgets.customText('Popular Articles', 18.0, AppColors.kPrimaryTwo, FontWeight.bold),
              ),
              Divider(
                thickness: 1,
                indent: 0,
                endIndent: 0,
                color: Colors.white,
                height: 20,
              ),
              ListView.builder(
                  itemCount: 5,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext bContext, int index) {
                    return _buildArticles();
                  }),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                child: CustomTextWidgets.customText('Browse All Articles', 18.0, AppColors.kPrimaryTwo, FontWeight.bold),
              ),
              IconButton(
                icon: IconWidgets.sizedIcon(
                    Icons.keyboard_arrow_down_rounded,
                    Colors.black,
                    60.0
                ),
                onPressed: () {  },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildArticles() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
      decoration: new BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: AppColors.backgroundGrey, spreadRadius: 1.5),
        ],
      ),
      child: Row(
        children: [
          IconWidgets.sizedIcon(Icons.sticky_note_2_rounded, AppColors.black[100]!, 30.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: CustomTextWidgets.customText("Profile Signup", 16.0, Colors.black, FontWeight.normal),
          ),
        ],
      ),
    );
  }
}
