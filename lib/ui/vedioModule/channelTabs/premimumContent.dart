import 'package:flutter/material.dart';
import 'package:workour/constants/app_colors.dart';
import 'package:workour/widgets/customTextWidgets.dart';
import 'package:workour/methods/json_method.dart';
import 'package:workour/models/DownloadsModel.dart';

class PremiumContent extends StatefulWidget {
  const PremiumContent({Key? key}) : super(key: key);

  @override
  _PremiumContentState createState() => _PremiumContentState();
}

class _PremiumContentState extends State<PremiumContent> {
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
            alignment: Alignment.center,
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

              CircleAvatar(
                radius: 20.0,
                backgroundColor: AppColors.kPrimaryTwo,
                child: Icon(Icons.lock,size: 20.0,color: AppColors.whiteColor,),
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
