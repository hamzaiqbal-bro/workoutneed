import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:workour/constants/stringAssets.dart';
import 'package:workour/models/DownloadsModel.dart';
import 'package:workour/models/NotesModel.dart';

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