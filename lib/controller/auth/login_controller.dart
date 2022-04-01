import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';
import '../../network/rest_route_api.dart';
import '../../routes/general_path.dart';
import '../../utils/app_variable.dart';
import '../../utils/user_preferences.dart';
import '../../view/auth/login_view.dart';
import '../../view/home_view.dart';

class LoginController extends GetxController {
  final emailTextController = TextEditingController(text: "");
  final passwordTextController = TextEditingController(text: "");
  var passwordVisible = false;
  var loginProcess = false.obs;
  bool changeButton = false;


  pwdOnOff(){
    passwordVisible = !passwordVisible;
    update();
  }

    login({required String email, required String password, context}) {
    print(email);
    RestRouteApi(GeneralPath.login)
        .postUrl({"email" : email,"password" : password, "devicetoken": "", "devicetype": ""})
        .then((onValue) async {
      if(onValue.status == 'success'){
        loginProcess(true);
        changeButton = true;
        update();
        await UserPreferences().storeStringValue(uemail, email);
        Get.to(()=>HomeView(), duration: Duration(seconds: 2));
      }else{
        loginProcess(false);
      }
      update();
    });
  }

  void navigateToLogin() {
    changeButton = false;
    update();
    Get.offAllNamed(LoginView.routeName);
  }


}