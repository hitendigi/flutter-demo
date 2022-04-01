import 'package:get/get.dart';
import '../utils/app_variable.dart';
import '../utils/user_preferences.dart';
import 'auth/login_controller.dart';

class HomeViewController extends GetxController{
String userName = '';
String userEmail = '';
String title = 'Home';

  @override
  void onInit() {
    fetchUrl();
    super.onInit();
  }

  fetchUrl() async {
    userEmail = (await UserPreferences().getStringValue(uemail)) ?? "";
    print('email:' + userEmail);
    update();
  }

  void signOut() async{
    await UserPreferences().storeStringValue(uemail, "");
    Get.find<LoginController>().navigateToLogin();
    update();
  }
}
