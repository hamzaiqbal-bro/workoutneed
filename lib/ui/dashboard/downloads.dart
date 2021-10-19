import 'package:flutter/material.dart';
import 'package:workour/constants/app_colors.dart';
import 'package:workour/methods/json_method.dart';
import 'package:workour/models/DownloadsModel.dart';
import 'package:workour/widgets/coustomTextWidgets.dart';
import 'package:workour/widgets/iconWidgets.dart';
import 'package:workour/widgets/imageWidgets.dart';

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
        title: Text("Downloads", style: TextStyle(color: AppColors.kPrimaryTwo, fontWeight: FontWeight.bold),),
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
                child: coustomTextWidgets.coustomText("Your Downloads", 16.0, AppColors.kPrimaryTwo, FontWeight.w500),
              ),
              Container(
                child: FutureBuilder(
                  future: readDownloadsJSONData(),
                  builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    if (snapshot.hasData){
                      return ListView.builder(
                          itemCount: snapshot.data.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext bContext, int index) {
                            DownloadsModel download = snapshot.data[index];
                            return _buildDownload(download);
                          });
                    }
                    else if(snapshot.hasError) {
                      return coustomTextWidgets.centeredText("Error while fetching data..!", 18.0, AppColors.kPrimaryOne, FontWeight.normal);
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
              margin: EdgeInsets.symmetric(vertical: 15.0),
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage(download.image)),
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                color: Colors.redAccent,
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    coustomTextWidgets.detailsText(download.text, TextStyle(
                        letterSpacing: 0.2,
                        overflow: TextOverflow.ellipsis,
                        color: Colors.black
                    )),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: coustomTextWidgets.defaultText(download.views, TextStyle(
                          color: AppColors.greyColor
                      ), TextAlign.start),
                    ),
                    Row(
                      children: [
                        imageWidgets.circularImage(download.image, 20.0, 20.0),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: coustomTextWidgets.defaultText(download.channelName, TextStyle(
                              color: AppColors.greyColor,
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

