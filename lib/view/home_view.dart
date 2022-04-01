import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/auth/login_controller.dart';
import '../controller/home_controller.dart';
import '../utils/app_utils.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final LoginController controller = GetInstance().find<LoginController>();
  final HomeViewController homeController = Get.put(HomeViewController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
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
      child: SafeArea(
        child: OrientationBuilder(builder: (context, orientation) {
          return LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              final height = getHeight(constraints);
              return Scaffold(
                //backgroundColor: Colors.blue.shade100,
                extendBodyBehindAppBar: true,
                body: GetBuilder<HomeViewController>(
                  builder: (logic) {
                    return Center(
                      child: Column(
                        children: [
                          SizedBox(height: 100,),
                          Text("Welcome"),
                          SizedBox(height:10,),
                          Text(logic.userEmail == null ? "" : logic.userEmail.toString()),
                          SizedBox(height:10,),
                          ElevatedButton(onPressed: (){
                            logic.signOut();
                          }, child: Text('Signout')),
                        ],
                      ),
                    );
                  },
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
