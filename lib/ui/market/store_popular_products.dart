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

class StorePopularProducts extends StatefulWidget {
  const StorePopularProducts({Key? key}) : super(key: key);

  @override
  _StorePopularProductsState createState() => _StorePopularProductsState();
}

class _StorePopularProductsState extends State<StorePopularProducts> {
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
        physics: BouncingScrollPhysics(),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 10.0),
                  child: coustomTextWidgets.coustomText("Nike", 18.0, AppColors.kPrimaryTwo, FontWeight.bold),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => StorePopularProducts()));
                },
              ),
              Container(
                padding: EdgeInsets.all(5.0),
                child: FutureBuilder(
                  future: readStoreProductsJSONData(),
                  builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    if (snapshot.hasData){
                      return AnimationLimiter(
                          child: GridView.builder(
                              shrinkWrap: true,
                              itemCount: snapshot.data.length,
                              scrollDirection: Axis.vertical,
                              physics: NeverScrollableScrollPhysics(),
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 20,
                                childAspectRatio: 1.0/1.5,
                              ),
                              itemBuilder: (BuildContext bContext, int index) {
                                ProductsModel productModel = snapshot.data[index];
                                return AnimationConfiguration.staggeredList(
                                  position: index,
                                  duration: const Duration(milliseconds: 1500),
                                  child: FlipAnimation(
                                      child: _buildStoreProducts(productModel)),
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
      ),
    );
  }

  _buildStoreProducts(ProductsModel productModel) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: AppColors.smokeWhiteColor,
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 200.0,
                  padding: const EdgeInsets.all(10.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    child: Image.asset(
                        productModel.imageUrl,
                        fit: BoxFit.fill
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: Icon(Icons.favorite, color: AppColors.whiteColor),
                      onPressed: () { },),
                  ),
                )
              ],
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: coustomTextWidgets.coustomText(productModel.name, 16.0, Colors.black, FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: coustomTextWidgets.coustomText("\$${productModel.price}", 14.0, AppColors.kPrimaryTwo, FontWeight.normal),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                        child: RatingBarIndicator(
                          rating: productModel.rating,
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
                  Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: imageWidgets.circleAvatar(productModel.iconUrl, 16.0, 18.0),
                  )
                ],
              ),
            )
          ],
        )
    );
  }
}
