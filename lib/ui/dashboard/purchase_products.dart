import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:workour/constants/app_colors.dart';
import 'package:workour/methods/json_method.dart';
import 'package:workour/models/PurchaseProductsModel.dart';
import 'package:workour/widgets/customTextWidgets.dart';
import 'package:workour/widgets/iconWidgets.dart';

class PurchaseProducts extends StatefulWidget {
  const PurchaseProducts({Key? key}) : super(key: key);

  @override
  _PurchaseProductsState createState() => _PurchaseProductsState();
}

class _PurchaseProductsState extends State<PurchaseProducts> with SingleTickerProviderStateMixin {

  late TabController tabController;

  static List<String> imagesLinks = [
    "https://i.pinimg.com/originals/cc/18/8c/cc188c604e58cffd36e1d183c7198d21.jpg",
    "https://www.kyoceradocumentsolutions.be/blog/wp-content/uploads/2019/03/iStock-881331810.jpg",
    "https://resources.matcha-jp.com/resize/720x2000/2020/04/23-101958.jpeg"
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
                      items: imagesLinks
                          .map((item) => ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        child: Image.network(item, fit: BoxFit.fill, width: MediaQuery.of(context).size.width - 100),
                      ))
                          .toList(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CustomTextWidgets.centeredText("Recently Purchased", 18.0, Colors.black, FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomTextWidgets.customText("Purchased Products", 18.0, Colors.black, FontWeight.bold),
              ),
              Container(
                child: FutureBuilder(
                  future: readPurchaseProductsJSONData(),
                  builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    if (snapshot.hasData){
                      return AnimationLimiter(
                        child: ListView.builder(
                            itemCount: snapshot.data.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext bContext, int index) {
                              PurchaseProductsModel purchaseProducts = snapshot.data[index];
                              return AnimationConfiguration.staggeredList(
                                position: index,
                                duration: const Duration(milliseconds: 1500),
                                child: FlipAnimation(
                                    child: _buildPurchaseProducts(purchaseProducts)),
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
        ),
      ),
    );
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  Widget _buildPurchaseProducts(PurchaseProductsModel purchaseProducts) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: AppColors.smokeWhiteColor, spreadRadius: 1.5),
        ],
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Container(
              width: 120.0,
              margin: EdgeInsets.only(right: 10.0),
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage(purchaseProducts.imageUrl),
                ),
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.0), topLeft: Radius.circular(10.0)),
                color: Colors.redAccent,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: CustomTextWidgets.myCustomText(purchaseProducts.name, 15.0, Colors.black, FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: CustomTextWidgets.detailsText(purchaseProducts.details, TextStyle(
                        color: Colors.black), 2
                    )
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomTextWidgets.customText("\$${purchaseProducts.price}", 18.0, AppColors.kPrimaryTwo, FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                            child: CustomTextWidgets.defaultText("item: ${purchaseProducts.item}", TextStyle(color: AppColors.greyColor, fontSize: 14.0), TextAlign.start),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0, right: 10.0),
                            child: CustomTextWidgets.defaultText("Qty: ${purchaseProducts.quantity}", TextStyle(color: AppColors.greyColor, fontSize: 14.0), TextAlign.start),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
