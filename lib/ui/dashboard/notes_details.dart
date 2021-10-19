import 'package:flutter/material.dart';
import 'package:workour/constants/app_colors.dart';
import 'package:workour/constants/stringAssets.dart';
import 'package:workour/widgets/coustomTextWidgets.dart';
import 'package:workour/widgets/iconWidgets.dart';

class NotesDetails extends StatefulWidget {
  const NotesDetails({Key? key}) : super(key: key);

  @override
  _NotesDetailsState createState() => _NotesDetailsState();
}

class _NotesDetailsState extends State<NotesDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1.0,
        title: Text("Notes", style: TextStyle(color: AppColors.kPrimaryTwo, fontWeight: FontWeight.bold),),
        centerTitle: true,
        leading: IconButton(
          icon: IconWidgets.customIcon(Icons.arrow_back, AppColors.kPrimaryTwo),
          onPressed: () => Navigator.pop(context, false),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                  padding: EdgeInsets.all(5.0),
                  child: coustomTextWidgets.coustomText("Title here", 18.0, AppColors.kPrimaryTwo, FontWeight.bold)),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 10.0),
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: coustomTextWidgets.defaultText(StringAssets.loremIpsumText, TextStyle(color: Colors.black), TextAlign.justify))
            ],
          ),
        ),
      ),
    );
  }
}
