import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:workour/constants/app_colors.dart';
import 'package:workour/constants/imageAssets.dart';
import 'package:workour/methods/json_method.dart';
import 'package:workour/models/NotesModel.dart';
import 'package:workour/ui/dashboard/notes_details.dart';
import 'package:workour/widgets/customTextWidgets.dart';
import 'package:workour/widgets/iconWidgets.dart';

class Notes extends StatefulWidget {
  const Notes({Key? key}) : super(key: key);

  @override
  _NotesState createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1.0,
        title: CustomTextWidgets.appBarTextWidget("Notes"),
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
              SizedBox(height: 10.0),
              Container(
                child: FutureBuilder(
                  future: readNotesJSONData(),
                  builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    if (snapshot.hasData){
                      return AnimationLimiter(
                        child: ListView.builder(
                            itemCount: snapshot.data.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext bContext, int index) {
                              NotesModel notes = snapshot.data[index];
                              return AnimationConfiguration.staggeredList(
                                position: index,
                                duration: const Duration(milliseconds: 1000),
                                child: FlipAnimation(
                                    child: _buildNotes(notes)),
                              );
                            }),
                      );
                    }
                    else if(snapshot.hasError) {
                      return CustomTextWidgets.centeredText("Error while fetching data..!", 18.0, AppColors.kPrimaryOne, FontWeight.normal);
                    }
                    return CircularProgressIndicator();
                  },

                ),
              )
            ],
          ),
        )
      ),
    );
  }

  Widget _buildNotes(NotesModel notes) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
        decoration: new BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: AppColors.backgroubdGrye, spreadRadius: 1.5),
          ],
        ),
        child: Row(
          children: [
            IconWidgets.sizedIcon(Icons.sticky_note_2_rounded, AppColors.black[100]!, 30.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: CustomTextWidgets.customText(notes.label, 16.0, AppColors.greyColor, FontWeight.normal),
            ),
            Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconWidgets.customIcon(Icons.check_circle_outline, AppColors.kPrimaryTwo),
                CustomTextWidgets.customText(notes.date, 12.0, AppColors.greyColor, FontWeight.normal),
              ],
            )
          ],
        ),
      ),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => NotesDetails()));
      },
    );
  }
}
