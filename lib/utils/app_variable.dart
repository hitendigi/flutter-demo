import 'package:flutter/cupertino.dart';

bool isDebugging = false;
bool isLoggedIn = false;
var loginToken;
String api = "";
const String toKen = "token";
const String uname = "uname";
String uemail = "email";
const String url = "urlport";
const String dmUserId = "id";

//It set for responsive ui
bool isMobile(BuildContext context) => MediaQuery.of(context).size.width < 900 && MediaQuery.of(context).size.height < 900;
bool isTab(BuildContext context) => MediaQuery.of(context).size.width >= 800 && MediaQuery.of(context).size.height >= 700 ;

//Enumeration
enum appFuStatus {
  success,
  dismissed,
  error,
  na,
}

