import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_provider/models/enum.dart';
import 'package:flutter_provider/models/sign_in_model.dart';

import 'package:flutter_provider/presnetations/api_call.dart';

import 'package:flutter_provider/utils/common_utils.dart';

import '../models/sign_in_response.dart';



class SignInViewModel extends ChangeNotifier {
  Status _status = Status.none;

  Status get status => _status;

  late SignInResponse _signInResponse;

  SignInResponse get signInResponse => _signInResponse;


  Future<void> signIn(SignInBody body) async {
    CommonUtil().checkInternetConnection().then((value) {
      if (value) {
        _status = Status.loading;
        notifyListeners();

        APICall().signIn(body).then((response) {
          _signInResponse =
              SignInResponse.fromJson(json.decode(response.body));
          if (_signInResponse.status == true) {
            _status = Status.success;
            notifyListeners();
          } else {
            _status = Status.failed;
            notifyListeners();
          }
        });
      } else {
        _status = Status.noInternet;
        notifyListeners();
      }
    });
  }
}
