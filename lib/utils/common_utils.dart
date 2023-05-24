import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class CommonUtil {
  Future<bool> checkInternetConnection() async {
    return await InternetConnectionChecker().hasConnection;
  }
   showErrorToast(String msg ){
     Fluttertoast.showToast(
         msg: msg ?? '',
         toastLength: Toast.LENGTH_SHORT,
         gravity: ToastGravity.CENTER,
         timeInSecForIosWeb: 1,
         backgroundColor: Colors.red,
         textColor: Colors.white,
         fontSize: 16.0
     );
   }
}