import 'package:get/get.dart';
import '../controller/home_controller.dart';
import '../view/auth/login_view.dart';
import '../view/auth/splash_view.dart';
import '../view/home_view.dart';
import 'all_routes.dart';

class AppRoutes {
  static List<GetPage> pages() => [
    GetPage(
      page: () =>  SplashScreen(),
      name: AllRoutes.splash,
    ),
    GetPage(
      page: () =>  LoginView(),
      name: AllRoutes.login,
    ),
    GetPage(
      page: () =>  HomeView(),
      name: AllRoutes.home,
        binding: BindingsBuilder(() {
          Get.put(HomeViewController());
        })
    ),
  ];
}
