
import 'package:get/get.dart';
import '../controller/auth/login_controller.dart';
import '../controller/auth/splash_controller.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SplashController(), permanent: true);
    Get.put(LoginController(), permanent: true);
  }
}
