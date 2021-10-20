import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:workour/constants/stringAssets.dart';
import 'package:workour/models/DownloadsModel.dart';
import 'package:workour/models/NotesModel.dart';
import 'package:workour/models/NotificationsModel.dart';
import 'package:workour/models/PurchaseProductsModel.dart';
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