import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:workour/alert_dialogs/custom_alerts.dart';
import 'package:workour/Request/ApiRequest.dart';
import 'package:workour/URL/ApiURl.dart';
import 'package:workour/prefs/SharedPrefs.dart';
import 'package:workour/ui/dashboard/dash_board.dart';

class LoginController extends GetxController {
  late TextEditingController emailTextController;
  late TextEditingController passwordTextController;

  @override
  void onInit() {
    emailTextController = TextEditingController();
    passwordTextController = TextEditingController();
    super.onInit();
  }

  void apiLogin(context) async {
    Request request = Request(url: URls.loginUrl, body:jsonEncode(
        {
          "email": emailTextController.text,
          "password": passwordTextController.text
        }
    )
    );

    request.post().then((value) async {
      print(value.body);
      if(value.statusCode == 200){
        final jsonData = jsonDecode(value.body);
        SharedPrefs.saveUserId(jsonData['payload']['user']['uid']);
        Navigator.of(context).pop(false);
        Fluttertoast.showToast(
            msg: "Successfully Login",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.blue[400],
            textColor: Colors.white,
            fontSize: 16.0);

        emailTextController.clear();
        passwordTextController.clear();

        Navigator.push(context, MaterialPageRoute(builder: (context) => DashBoard()));
      }else if(value.statusCode == 400){
        Navigator.of(context).pop(false);
        customAlert(context, jsonDecode(value.body)['error']['code']);
      }else{
        Navigator.of(context).pop(false);
        customAlert(context, "Request could not be completed.");
      }
    });
  }

  @override
  void onClose() {
    emailTextController.dispose();
    passwordTextController.dispose();
    super.onClose();
  }
}