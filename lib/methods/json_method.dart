import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:workour/constants/string_assets.dart';
import 'package:workour/models/CartModel.dart';
import 'package:workour/models/CategoryModel.dart';
import 'package:workour/models/DownloadsModel.dart';
import 'package:workour/models/NotesModel.dart';
import 'package:workour/models/NotificationsModel.dart';
import 'package:workour/models/ProductsModel.dart';
import 'package:workour/models/PurchaseProductsModel.dart';
import 'package:workour/models/ReviewsModel.dart';
import 'package:workour/models/SubscriptionModel.dart';

Future readDownloadsJSONData() async {
  List downloadsList;

  String response = await rootBundle.loadString(StringAssets.jsonFile);

  var data = await json.decode(response);
  var result;

  result = data["Downloads"] as List;
  downloadsList = result
      .map<DownloadsModel>(
          (json) => DownloadsModel.fromJson(json))
      .toList();

  print(downloadsList);

  return downloadsList;
}

Future readNotesJSONData() async {
  List notesList;

  String response = await rootBundle.loadString(StringAssets.jsonFile);

  var data = await json.decode(response);
  var result;

  result = data["Notes"] as List;
  notesList = result
      .map<NotesModel>(
          (json) => NotesModel.fromJson(json))
      .toList();

  return notesList;
}

Future readNotificationsJSONData() async {
  List notificationsList;

  String response = await rootBundle.loadString(StringAssets.jsonFile);

  var data = await json.decode(response);
  var result;

  result = data["Notifications"] as List;
  notificationsList = result
      .map<NotificationsModel>(
          (json) => NotificationsModel.fromJson(json))
      .toList();

  return notificationsList;
}

Future readSubscriptionChannelsJSONData() async {
  List subChannelsList;

  String response = await rootBundle.loadString(StringAssets.jsonFile);

  var data = await json.decode(response);
  var result;

  result = data["Subscription"] as List;
  subChannelsList = result
      .map<SubscriptionModel>(
          (json) => SubscriptionModel.fromJson(json))
      .toList();

  return subChannelsList;
}

Future readPurchaseProductsJSONData() async {
  List purchaseProductsList;

  String response = await rootBundle.loadString(StringAssets.jsonFile);

  var data = await json.decode(response);
  var result;

  result = data["Purchase_Products"] as List;
  purchaseProductsList = result
      .map<PurchaseProductsModel>(
          (json) => PurchaseProductsModel.fromJson(json))
      .toList();

  return purchaseProductsList;
}

Future readCategoryJSONData() async {
  List categoriesList;

  String response = await rootBundle.loadString(StringAssets.jsonFile);

  var data = await json.decode(response);
  var result;

  result = data["Categories"] as List;
  categoriesList = result
      .map<CategoryModel>(
          (json) => CategoryModel.fromJson(json))
      .toList();

  return categoriesList;
}

Future readProductsJSONData() async {
  List productsList;

  String response = await rootBundle.loadString(StringAssets.jsonFile);

  var data = await json.decode(response);
  var result;

  result = data["Products"] as List;
  productsList = result
      .map<ProductsModel>(
          (json) => ProductsModel.fromJson(json))
      .toList();

  return productsList;
}

Future readTrendingProductsJSONData() async {
  List trendingProductsList;

  String response = await rootBundle.loadString(StringAssets.jsonFile);

  var data = await json.decode(response);
  var result;

  result = data["Trending_Products"] as List;
  trendingProductsList = result
      .map<ProductsModel>(
          (json) => ProductsModel.fromJson(json))
      .toList();

  return trendingProductsList;
}

Future readPopularProductsJSONData() async {
  List popularProductsList;

  String response = await rootBundle.loadString(StringAssets.jsonFile);

  var data = await json.decode(response);
  var result;

  result = data["Popular_Products"] as List;
  popularProductsList = result
      .map<ProductsModel>(
          (json) => ProductsModel.fromJson(json))
      .toList();

  return popularProductsList;
}

Future readStoreProductsJSONData() async {
  List storeProductsList;

  String response = await rootBundle.loadString(StringAssets.jsonFile);

  var data = await json.decode(response);
  var result;

  result = data["Store_Products"] as List;
  storeProductsList = result
      .map<ProductsModel>(
          (json) => ProductsModel.fromJson(json))
      .toList();

  return storeProductsList;
}

Future readCartProductsJSONData() async {
  List cartList;

  String response = await rootBundle.loadString(StringAssets.jsonFile);

  var data = await json.decode(response);
  var result;

  result = data["Cart"] as List;
  cartList = result
      .map<CartModel>(
          (json) => CartModel.fromJson(json))
      .toList();

  return cartList;
}

Future readRatingAndReviewsJSONData() async {
  List reviewsList;

  String response = await rootBundle.loadString(StringAssets.jsonFile);

  var data = await json.decode(response);
  var result;

  result = data["Rating_and_Reviews"] as List;
  reviewsList = result
      .map<ReviewsModel>(
          (json) => ReviewsModel.fromJson(json))
      .toList();

  return reviewsList;
}
