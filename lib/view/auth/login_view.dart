import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_demo/utils/theme_color.dart';
import 'package:get/get.dart';
import '../../controller/auth/login_controller.dart';

class LoginView extends GetView<LoginController> {
  static const String routeName = '/login';
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          Size size = MediaQuery
              .of(context)
              .size;
          return Scaffold(
            backgroundColor: ThemeColor.textLight,
            body: WillPopScope(
                onWillPop: () {
                  showDialog(
                    context: context,
                    builder: (context) =>
                        AlertDialog(
                          title: Text('Are you sure?'),
                          content: Text('Do you want to exit an App'),
                          actions: <Widget>[
                            FlatButton(
                              onPressed: () => Navigator.of(context).pop(false),
                              child: Text('No'),
                            ),
                            FlatButton(
                              onPressed: () => exit(0),
                              /*Navigator.of(context).pop(true)*/
                              child: Text('Yes'),
                            ),
                          ],
                        ),
                  );
                  return new Future(() => false);
                },

                child: GetBuilder<LoginController>(
                  builder: (logic) {
                    return Container(
                      padding: EdgeInsets.zero,
                      child: SingleChildScrollView(

                        child: Center(
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: <Widget>[
                                const SizedBox(
                                  height: 20,
                                ),
                                Image.asset(
                                    "images/login.jpg",
                                  height: 180,
                                  width: MediaQuery.of(context).size.width,
                                  ),
                                SizedBox(
                                  height: orientation == Orientation.portrait
                                      ? 40
                                      : 30,
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 40),
                                    alignment: Alignment.topLeft,
                                    child: Text('Login', style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),)),
                                SizedBox(height: 20,),
                                Container(
                                  width: orientation == Orientation.portrait
                                      ? size.width * 0.9
                                      : size.width * 0.6,
                                  padding: EdgeInsets.symmetric(horizontal: 32),
                                  child: TextFormField(
                                    textInputAction: TextInputAction.next,
                                    controller: controller
                                        .emailTextController,
                                    cursorColor: Theme.of(context).cursorColor,
                                    decoration: InputDecoration(
                                      icon: Icon(Icons.email),
                                      labelText: 'Email ID',
                                      labelStyle: TextStyle(
                                        color: ThemeColor.primaryMain,
                                      ),
                                      helperText: 'Email ID',
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: ThemeColor.primaryMain),
                                      ),
                                    ),
                                    validator: (val) {
                                    if (val!.isEmpty) {
                                      Get.snackbar(
                                        "Login Failed","Enter Valid Email",
                                        snackPosition: SnackPosition.BOTTOM,
                                        backgroundColor: Colors.red,
                                        borderRadius: 20,
                                        margin: EdgeInsets.all(15),
                                        colorText: Colors.white,
                                        duration: Duration(seconds: 1),
                                        isDismissible: true,
                                        dismissDirection: DismissDirection.horizontal,
                                        //forwardAnimationCurve: Curves.easeOutBack,
                                      );
                                    }
                                    return null;
                                  },
                                  ),
                                ),
                                Container(
                                  width: orientation == Orientation.portrait
                                      ? size.width * 0.9
                                      : size.width * 0.6,
                                  padding: EdgeInsets.symmetric(horizontal: 32),
                                  child: TextFormField(
                                    textInputAction: TextInputAction.done,
                                    controller: logic.passwordTextController,
                                    obscureText: !logic.passwordVisible,
                                    cursorColor: Theme.of(context).cursorColor,
                                    decoration: InputDecoration(
                                      icon: Icon(Icons.lock),
                                      labelText: 'Password',
                                      labelStyle: TextStyle(
                                        color: ThemeColor.primaryMain,
                                      ),
                                      helperText: 'Password',
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          logic.passwordVisible
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                        ),
                                        onPressed: () {
                                          logic.pwdOnOff();
                                        },

                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: ThemeColor.primaryMain),
                                      ),
                                    ),
                                    validator: (val) {
                                      if (val!.isEmpty) {
                                        Get.snackbar(
                                          "Login Failed","Enter Valid Password",
                                          snackPosition: SnackPosition.BOTTOM,
                                          backgroundColor: Colors.red,
                                          borderRadius: 20,
                                          margin: EdgeInsets.all(15),
                                          colorText: Colors.white,
                                          duration: Duration(seconds: 1),
                                          isDismissible: true,
                                          dismissDirection: DismissDirection.horizontal,
                                          // forwardAnimationCurve: Curves.easeOutBack,

                                        );
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 50),
                                  alignment: Alignment.centerRight,
                                  child: Text('Forgot Password?', style: TextStyle(color: ThemeColor.primaryMain, fontSize: 16),),
                                ),
                                const SizedBox(height: 25,),
                                logic.changeButton == false ?
                                InkWell(
                                  child: Container(
                                    width: MediaQuery.of(context).size.width/1.3,
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(16)),
                                        color: ThemeColor.primaryMain),
                                    child: TextButton(
                                      child: const Text(
                                        "Login",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 18),
                                      ),
                                      onPressed:  !logic.changeButton ? () async {
                                        _formKey.currentState!
                                            .validate();
                                        controller.login(
                                            email: controller
                                                .emailTextController
                                                .text,
                                            password: controller
                                                .passwordTextController
                                                .text,
                                            context: context);
                                      } : null,
                                    ),
                                  ),
                                ) : Center(child: CircularProgressIndicator(),),
                                SizedBox(height: 30,),
                                Container(
                                    width: MediaQuery.of(context).size.width/1.3,
                                    child: Row(
                                      children: [
                                        Expanded(child: Divider(color: ThemeColor.textDark,thickness: 1,)),
                                        SizedBox(width: 5,),
                                        Text('OR'),
                                        SizedBox(width: 5,),
                                        Expanded(child: Divider(color: ThemeColor.textDark,thickness: 1,)),
                                      ],
                                    )),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 100, vertical: 10),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          flex: 6,
                                          child: Text('New to logistics? ', style: TextStyle(fontSize: 16),)),
                                      Expanded( flex: 4,child: Text('Register', style: TextStyle(color: ThemeColor.primaryMain, fontSize: 16),)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                )
            ),
          );
        },
      );
    });
  }
}
