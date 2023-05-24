import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_provider/models/sign_in_model.dart';

import 'package:flutter_provider/presnetations/api_call.dart';
import 'package:flutter_provider/utils/common_utils.dart';
import 'package:fluttertoast/fluttertoast.dart';


import '../models/sign_in_response.dart';



class SignInViewModel extends ChangeNotifier {

  late SignInResponse _signInResponse;

  SignInResponse get signInResponse => _signInResponse;

  bool loading= false;
  bool isBack= false;
  bool failed= false;


  Future<void> signIn(SignInBody body) async {
        loading=true;
        notifyListeners();

        APICall().signIn(body).then((response) {
          _signInResponse =
              SignInResponse.fromJson(json.decode(response.body));
          if (_signInResponse.status == true) {
            isBack = true;
            notifyListeners();
          }else{
            CommonUtil().showToast(_signInResponse.message ?? '');
          }
        });
      loading = false;
      notifyListeners();

  }
}
