import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:workour/constants/app_colors.dart';
import 'package:workour/methods/json_method.dart';
import 'package:workour/models/DownloadsModel.dart';
import 'package:workour/models/PurchaseProductsModel.dart';
import 'package:workour/widgets/coustomTextWidgets.dart';
import 'package:workour/widgets/iconWidgets.dart';
import 'package:workour/widgets/imageWidgets.dart';

class PremiumContent extends StatefulWidget {
  const PremiumContent({Key? key}) : super(key: key);

  @override
  _PremiumContentState createState() => _PremiumContentState();
}

class _PremiumContentState extends State<PremiumContent> with SingleTickerProviderStateMixin {

  late TabController tabController;
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroubdGrye,
        elevation: 0,
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
              Container(
                height: 250.0,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: AppColors.backgroubdGrye,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15.0),
                      bottomRight: Radius.circular(15.0)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(
                        autoPlay: true,
                        aspectRatio: 2.8,
                        enlargeCenterPage: true,
                        autoPlayInterval: const Duration(seconds: 5),
                        autoPlayAnimationDuration: const Duration(milliseconds: 800),
                      ),
                      items: imgList
                          .map((item) => ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        child: Image.network(item, fit: BoxFit.fill, width: MediaQuery.of(context).size.width - 100),
                      ))
                          .toList(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: coustomTextWidgets.centeredText("Recently Watched", 18.0, Colors.black, FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: coustomTextWidgets.coustomText("Premium Content", 18.0, Colors.black, FontWeight.bold),
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
                                duration: const Duration(milliseconds: 1500),
                                child: FlipAnimation(
                                    child: _buildPremiumContent(download)),
                              );
                            }),
                      );
                    }
                    else if(snapshot.hasError) {
                      return coustomTextWidgets.centeredText("Error while fetching data..!" + snapshot.error.toString(), 18.0, AppColors.kPrimaryOne, FontWeight.normal);
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

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  Widget _buildPremiumContent(DownloadsModel download) {
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
                      coustomTextWidgets.detailsText(download.text, TextStyle(
                          letterSpacing: 0.2,
                          // overflow: TextOverflow.ellipsis,
                          color: Colors.black
                      ), 3),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2.0),
                        child: coustomTextWidgets.defaultText(download.views, TextStyle(
                            color: AppColors.greyColor, fontSize: 12.0, fontWeight: FontWeight.w600
                        ), TextAlign.start),
                      ),
                      Row(
                        children: [
                          imageWidgets.circularImage(download.image, 20.0, 20.0),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: coustomTextWidgets.defaultText(download.channelName, TextStyle(
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
