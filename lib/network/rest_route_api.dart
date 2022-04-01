import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../models/reponse_model.dart';
import '../utils/app_utils.dart';
import '../utils/app_variable.dart';

class RestRouteApi {

  dynamic url;
  dynamic path;

  //final bool auth;
  RestRouteApi(
    this.path,

  ) {
    url = api + path;
  }

  Future<dynamic> postUrl(postData) async {
    print('posturl:${url}');
    printDebug(postData.toString(), tag: url);
    try {
      final response = await http.post(Uri.parse(url),
          body: json.encode(postData), headers: getHeader());
      var retData = returnResponse(response, );
      printDebug("@@@@@@@@@@");
      printDebug(retData);
      if (retData != null) {
        return ResponseModel.fromJson(retData);
      }
    } catch (error) {
      printDebug(error, tag: "res Error");
      showToast(url + "is not accessible \n" + error.toString(), );
    }
    return null;
  }

  Map<String, String> getHeader() {
    Map<String, String> data = new Map<String, String>();
    data['Content-Type'] = 'application/json';
    data['Accept'] = 'application/json';
    // data['Authorization'] = 'Bearer $loginToken';
    data['Origin'] = url;
    return data;
  }
}
