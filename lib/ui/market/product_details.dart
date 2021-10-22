import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:workour/constants/app_colors.dart';
import 'package:workour/constants/imageAssets.dart';
import 'package:workour/methods/json_method.dart';
import 'package:workour/models/ProductsModel.dart';
import 'package:workour/widgets/coustomTextWidgets.dart';
import 'package:workour/widgets/iconWidgets.dart';
import 'package:workour/widgets/imageWidgets.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1.0,
        centerTitle: true,
        title: Text("Store", style: TextStyle(color: AppColors.kPrimaryTwo, fontWeight: FontWeight.bold),),
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: imageWidgets.circularImage(imageAssets.profileImage, 60.0, 60.0),
        ),
        actions: [
          IconButton(
              padding: EdgeInsets.all(5.0),
              icon: IconWidgets.customIcon(Icons.search, AppColors.kPrimaryOne),
              onPressed: () {
              }
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, top: 10.0),
                      child: coustomTextWidgets.coustomText("Reviews:", 18.0, Colors.black, FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                color: AppColors.backgroubdGrye,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, top: 10.0),
                      child: coustomTextWidgets.coustomText("Seller:", 18.0, Colors.black, FontWeight.bold),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
                            child: imageWidgets.circleAvatar(imageAssets.profileImage, 28.0, 30.0)),
                        Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0, top: 10.0),
                                  child: coustomTextWidgets.coustomText("Haseeb Shinwari", 16.0, AppColors.kPrimaryTwo, FontWeight.w600),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: coustomTextWidgets.coustomText("Phone Number: 989-288-6896", 14.0, Colors.black, FontWeight.normal),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: coustomTextWidgets.customText("Address: 428 Hart Ridge Road, SANTA MONICA, California", 14.0, Colors.black, FontWeight.normal),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10.0),
                                  child: Row(
                                    children: [
                                      coustomTextWidgets.customText("Seller Rating: ", 14.0, Colors.black, FontWeight.normal),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                                        child: RatingBarIndicator(
                                          rating: 4.5,
                                          itemCount: 5,
                                          itemSize: 18.0,
                                          physics: BouncingScrollPhysics(),
                                          itemBuilder: (context, _) => Icon(
                                            Icons.star,
                                            color: AppColors.kPrimaryTwo,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, top: 10.0),
                      child: coustomTextWidgets.coustomText("Products From Seller", 20.0, Colors.black, FontWeight.bold),
                    ),
                    Container(
                      height: 180.0,
                      padding: EdgeInsets.all(5.0),
                      child: FutureBuilder(
                        future: readTrendingProductsJSONData(),
                        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                          if (snapshot.hasData){
                            return AnimationLimiter(
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: snapshot.data.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (BuildContext bContext, int index) {
                                      ProductsModel productModel = snapshot.data[index];
                                      return AnimationConfiguration.staggeredList(
                                        position: index,
                                        duration: const Duration(milliseconds: 1500),
                                        child: FlipAnimation(
                                            child: _buildSellerProducts(productModel)),
                                      );
                                    })
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
              Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, top: 10.0),
                      child: coustomTextWidgets.coustomText("You may also like", 20.0, Colors.black, FontWeight.bold),
                    ),
                    Container(
                      height: 180.0,
                      padding: EdgeInsets.all(5.0),
                      child: FutureBuilder(
                        future: readTrendingProductsJSONData(),
                        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                          if (snapshot.hasData){
                            return AnimationLimiter(
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: snapshot.data.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (BuildContext bContext, int index) {
                                      ProductsModel productModel = snapshot.data[index];
                                      return AnimationConfiguration.staggeredList(
                                        position: index,
                                        duration: const Duration(milliseconds: 1500),
                                        child: FlipAnimation(
                                            child: _buildLikeProducts(productModel)),
                                      );
                                    })
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
            ],
          ),
        ),
      ),
    );
  }

  _buildSellerProducts(ProductsModel productModel) {
    return IntrinsicHeight(
      child: Container(
        width: 180.0,
        margin: EdgeInsets.all(5),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)),
                child: Image.asset(
                    productModel.imageUrl,
                    fit: BoxFit.fill
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.0),
                          child: coustomTextWidgets.customText(productModel.name, 14.0, Colors.black, FontWeight.bold)),
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.0),
                        child: imageWidgets.circularImage(productModel.iconUrl, 30.0, 30.0))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _buildLikeProducts(ProductsModel productModel) {
    return IntrinsicHeight(
      child: Container(
        width: 180.0,
        margin: EdgeInsets.all(5),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)),
                child: Image.asset(
                    productModel.imageUrl,
                    fit: BoxFit.fill
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.0),
                          child: coustomTextWidgets.customText(productModel.name, 14.0, Colors.black, FontWeight.bold)),
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.0),
                        child: imageWidgets.circularImage(productModel.iconUrl, 30.0, 30.0))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
