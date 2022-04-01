import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo/utils/user_preferences.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';

import '../view/auth/login_view.dart';
import 'app_variable.dart';

double getWidth(BoxConstraints constraints) {
  var width = /*   constraints.maxHeight < constraints.maxWidth ? constraints.maxHeight :   */ constraints
      .maxWidth;
  return width * 0.01; // 1 % of  Width
}

double getHeight(BoxConstraints constraints) {
  var heigth = constraints
      .maxHeight /*  > constraints.maxWidth ? constraints.maxHeight : constraints.maxWidth */;
  return heigth * 0.01; // 1 % of  height
}

printDebug(msg, {tag = ''}) {
  // if(isDebugging)
  print(tag + msg.toString());
}

  void openScreen(Widget screenName){
  Get.to(()=>screenName);
}


dynamic returnResponse(http.Response response) {
  print(response.body.toString());
  if (response.body.toString().contains("Invalid token") ||
      response.body.toString().contains("E INVALID JWT TOKEN")) {
    showToast("Login Expired", );
    UserPreferences().storeStringValue(toKen, "");
    Get.to(() => LoginView());
  }
  print('responce code: ${response.statusCode}');
  switch (response.statusCode) {
    case 200:
      var responseJson = json.decode(response.body.toString());
      return responseJson;
    case 400:
      showToast("Bad Request Exception 400", );
      print("Bad Request Exception " + response.body.toString());
      return null;
    case 401:
    case 403:
      showToast("Unauthorised Exception 401/403", );
      print("Unauthorised Exception " + response.body.toString());
      return null;
    case 500:
    default:
      print(
          'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
      showToast(
          'Error occured while Communication with Server with StatusCode : ${response.statusCode}',
          );
      return null;
  }
}

void showToast(dynamic msg, {dynamic duration, dynamic gravity}) {
  var x = msg.toLowerCase();
  Color color = x.contains(RegExp('r"^(?=.*not)(?=.*error)"'))
      ? Colors.red
      : Colors.amber;
  SystemChannels.textInput.invokeMethod('TextInput.hide');
  Get.snackbar(
    msg,"",
    snackPosition: SnackPosition.BOTTOM,);
  // if (msg != null) Fluttertoast.showToast(msg : msg, toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.CENTER,);
}

void showredToast(String msg, BuildContext context, {required int duration, required int gravity}) {
  SystemChannels.textInput.invokeMethod('TextInput.hide');
  Get.snackbar(
    msg,"",
    snackPosition: SnackPosition.BOTTOM,);
  // if (msg != null) Fluttertoast.showToast(msg : msg, toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.CENTER, textColor: Colors.white, backgroundColor: Colors.red,);
}