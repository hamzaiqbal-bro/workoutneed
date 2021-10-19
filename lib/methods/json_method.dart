import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:workour/models/DownloadsModel.dart';

Future readJSONData() async {
  List downloadsList;

  String response = await rootBundle.loadString("assets/json/downloads.json");

  var data = await json.decode(response);
  var result;

  result = data["Downloads"] as List;
  downloadsList = result
      .map<DownloadsModel>(
          (json) => DownloadsModel.fromJson(json))
      .toList();

  return downloadsList;
}