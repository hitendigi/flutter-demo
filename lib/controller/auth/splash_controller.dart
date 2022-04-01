
import 'package:get/get.dart';

import '../../routes/all_routes.dart';
import '../../utils/app_variable.dart';
import '../../utils/user_preferences.dart';
import 'login_controller.dart';

class SplashController extends GetxController{
  // final appdata = GetStorage();
  final LoginController controller = Get.put(LoginController());
  String mail = "";

  @override
  void onInit(){
    print('initSplash');
    Future.delayed(const Duration(milliseconds: 2000), () {
      checkLogin();
    });
    super.onInit();
  }

  checkLogin() async {
    // loginToken = await UserPreferences().getStringValue(toKen);
    mail = (await UserPreferences().getStringValue(uemail)) ?? "";
    print(mail.toString());

    if (mail != "") {
      controller.loginProcess = true.obs;
      Get.offAndToNamed(AllRoutes.home);
    } else {
      Get.offAndToNamed(AllRoutes.login);
    }
  }
}
