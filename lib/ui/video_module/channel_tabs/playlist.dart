import 'package:flutter/material.dart';
import 'package:workour/constants/app_colors.dart';
import 'package:workour/widgets/custom_text_widgets.dart';
import 'package:workour/methods/json_method.dart';
import 'package:workour/models/DownloadsModel.dart';

class PlayList extends StatefulWidget {
  const PlayList({Key? key}) : super(key: key);

  @override
  _PlayListState createState() => _PlayListState();
}

class _PlayListState extends State<PlayList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: readDownloadsJSONData(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData){
            return ListView.builder(
                itemCount: snapshot.data.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext bContext, int index) {
                  DownloadsModel download = snapshot.data[index];
                  return _buildDownload(download);
                });
          }
          else if(snapshot.hasError) {
            return CustomTextWidgets.centeredText("Error while fetching data..!", 18.0, AppColors.kPrimaryOne, FontWeight.normal);
          }
          return CircularProgressIndicator();
        },

      ),
    );
  }

  Widget _buildDownload(DownloadsModel download) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Stack(
              alignment: Alignment.centerLeft,
              children: [
                Container(
                  width: 140.0,
                  height: 100.0,
                  margin: EdgeInsets.symmetric(vertical: 5.0),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover, image: AssetImage(download.image)),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    color: Colors.redAccent,
                  ),
                ),

                Container(
                  color: AppColors.darkBlack.withOpacity(0.3),
                  height: 80,
                  width: 60.0,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomTextWidgets.customText('12', 15.0, AppColors.whiteColor, FontWeight.bold),
                      Icon(Icons.format_list_numbered,color: AppColors.whiteColor,)
                    ],
                  ),

                )
              ],
            ),
            Expanded(
              child: Container(
                  padding: EdgeInsets.only(left: 5.0, top: 2.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextWidgets.detailsText(download.text, TextStyle(
                          letterSpacing: 0.2,
                          // overflow: TextOverflow.ellipsis,
                          color: Colors.black
                      ), 3),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2.0),
                        child: CustomTextWidgets.defaultText(download.views, TextStyle(
                            color: AppColors.greyColor, fontWeight: FontWeight.w600
                        ), TextAlign.start),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: CustomTextWidgets.defaultText(download.channelName, TextStyle(
                                color: AppColors.greyColor,
                                fontSize: 12.0,
                                fontWeight: FontWeight.w600
                            ), TextAlign.start),
                          ),
                        ],
                      )
                    ],
                  )
              ),
            )
          ],
        ),
      ),
    );
  }
}
