import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_provider/models/register_model.dart';
import 'package:flutter_provider/models/register_response.dart';
import 'package:flutter_provider/models/sign_in_model.dart';

import 'package:flutter_provider/presnetations/api_call.dart';
import 'package:flutter_provider/utils/common_utils.dart';
import 'package:fluttertoast/fluttertoast.dart';


import '../models/sign_in_response.dart';



class RegisterViewModel extends ChangeNotifier {

  late RegisterResponse _registerResponse;

  RegisterResponse get registerResponse => _registerResponse;

  bool loading= false;
  bool isBack= false;
 // bool failed= false;


  Future<void> register(RegisterBody body) async {
    loading=true;
    notifyListeners();

    APICall().register(body).then((response) {
      _registerResponse =
          RegisterResponse.fromJson(json.decode(response.body));
      if (_registerResponse.status == true) {
        isBack = true;
        notifyListeners();
      }else{
        CommonUtil().showToast(_registerResponse.message ?? '');
      }
    });
    loading = false;
    notifyListeners();

  }
}
