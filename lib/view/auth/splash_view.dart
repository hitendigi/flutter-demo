import 'package:flutter/material.dart';
import 'package:flutter_demo/utils/theme_color.dart';
import 'package:get/get.dart';
import '../../controller/auth/splash_controller.dart';
import '../../utils/app_utils.dart';
import '../../utils/app_variable.dart';

class SplashScreen extends GetView<SplashController> {

  @override
  Widget build(BuildContext context) {
    // bool isDarkMode = controller.appdata.read(darkMode)?? false;
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final double width = getWidth(constraints);
        final double height = getHeight(constraints);

        return Scaffold(
          backgroundColor: ThemeColor.textLight,
          body: AnimatedOpacity(
            duration: const Duration(milliseconds: 100),
            opacity: 1.0,
            child: Center(
              child: Image.asset(
                "images/splash.jpg",
                height: height * 100,
                width: width * 100,
              ),
            ),
          ),
        );
      },
    );
  }
}
