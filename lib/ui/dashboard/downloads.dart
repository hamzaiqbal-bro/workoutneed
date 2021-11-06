import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:workour/constants/app_colors.dart';
import 'package:workour/methods/json_method.dart';
import 'package:workour/models/DownloadsModel.dart';
import 'package:workour/widgets/custom_text_widgets.dart';
import 'package:workour/widgets/icon_widgets.dart';
import 'package:workour/widgets/image_widgets.dart';

class Downloads extends StatefulWidget {
  const Downloads({Key? key}) : super(key: key);

  @override
  _DownloadsState createState() => _DownloadsState();
}

class _DownloadsState extends State<Downloads> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1.0,
        title: CustomTextWidgets.appBarTextWidget("Downloads"),
        centerTitle: true,
        leading: IconButton(
          icon: IconWidgets.customIcon(Icons.arrow_back, AppColors.kPrimaryTwo),
          onPressed: () => Navigator.pop(context, false),
        ),
        actions: [
          IconButton(onPressed: null, icon: IconWidgets.customIcon(Icons.search, AppColors.kPrimaryTwo))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomTextWidgets.customText("Your Downloads", 16.0, AppColors.kPrimaryTwo, FontWeight.w500),
              ),
              Container(
                child: FutureBuilder(
                  future: readDownloadsJSONData(),
                  builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    if (snapshot.hasData){
                      return AnimationLimiter(
                        child: ListView.builder(
                            itemCount: snapshot.data.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext bContext, int index) {
                              DownloadsModel download = snapshot.data[index];
                              return AnimationConfiguration.staggeredList(
                                position: index,
                                duration: const Duration(milliseconds: 1000),
                                child: ScaleAnimation(
                                    child: _buildDownload(download)),
                              );
                            }),
                      );
                    }
                    else if(snapshot.hasError) {
                      return CustomTextWidgets.centeredText("Error while fetching data..!" + snapshot.error.toString(), 18.0, AppColors.kPrimaryOne, FontWeight.normal);
                    }
                    return CircularProgressIndicator();
                  },

                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDownload(DownloadsModel download) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Container(
              width: 170.0,
              margin: EdgeInsets.symmetric(vertical: 5.0),
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage(download.image)),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                color: Colors.redAccent,
              ),
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
                          color: AppColors.greyColor, fontSize: 12.0, fontWeight: FontWeight.w600
                      ), TextAlign.start),
                    ),
                    Row(
                      children: [
                        ImageWidgets.circularImage(download.image, 20.0, 20.0),
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

