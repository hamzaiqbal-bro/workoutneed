import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:workour/constants/app_colors.dart';
import 'package:workour/constants/imageAssets.dart';
import 'package:workour/methods/json_method.dart';
import 'package:workour/models/ProductsModel.dart';
import 'package:workour/ui/market/store_popular_products.dart';
import 'package:workour/widgets/customTextWidgets.dart';
import 'package:workour/widgets/iconWidgets.dart';
import 'package:workour/widgets/imageWidgets.dart';

class CategoryProducts extends StatefulWidget {
  const CategoryProducts({Key? key}) : super(key: key);

  @override
  _CategoryProductsState createState() => _CategoryProductsState();
}

class _CategoryProductsState extends State<CategoryProducts> with SingleTickerProviderStateMixin {

  late TabController tabController;
  final List<String> imgList = [
    imageAssets.categoryMainImage,
    imageAssets.categoryMainImage,
    imageAssets.categoryMainImage,
    imageAssets.categoryMainImage
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
        backgroundColor: Colors.white,
        elevation: 1.0,
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ImageWidgets.circularImage(imageAssets.profileImage, 60.0, 60.0),
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
              Container(
                padding: EdgeInsets.all(10.0),
                child: CarouselSlider(
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
                    child: Image.asset(item, fit: BoxFit.fill, width: MediaQuery.of(context).size.width - 50),
                  ))
                      .toList(),
                ),
              ),
              InkWell(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 10.0),
                  child: CustomTextWidgets.customText("Popular of All", 18.0, Colors.black, FontWeight.bold),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => StorePopularProducts()));
                },
              ),
              Container(
                padding: EdgeInsets.all(5.0),
                child: FutureBuilder(
                  future: readProductsJSONData(),
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
                                      child: _buildAllProducts(productModel, index)),
                                );
                              })
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

  _buildAllProducts(ProductsModel productModel, int index) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: AppColors.smokeWhiteColor,
        ),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topCenter,
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
                  padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: Icon(Icons.favorite, color: index%2 != 0 ? AppColors.kPrimaryTwo : AppColors.whiteColor),
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
                        child: CustomTextWidgets.customText(productModel.name, 16.0, Colors.black, FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: CustomTextWidgets.customText("\$${productModel.price}", 14.0, AppColors.kPrimaryTwo, FontWeight.normal),
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
                    child: ImageWidgets.circleAvatar(productModel.iconUrl, 16.0, 18.0),
                  )
                ],
              ),
            )
          ],
        )
    );
  }
}
