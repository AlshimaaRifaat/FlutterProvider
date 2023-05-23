import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_provider/models/enum.dart';
import 'package:flutter_provider/models/sign_in_model.dart';

import 'package:flutter_provider/presnetations/api_call.dart';

import 'package:flutter_provider/utils/common_utils.dart';

import '../models/sign_in_response.dart';



class SignInViewModel extends ChangeNotifier {

  late SignInResponse _signInResponse;

  SignInResponse get signInResponse => _signInResponse;

  bool loading= false;
  bool isBack= false;


  Future<void> signIn(SignInBody body) async {
        loading=true;
        notifyListeners();

        APICall().signIn(body).then((response) {
          _signInResponse =
              SignInResponse.fromJson(json.decode(response.body));
          if (_signInResponse.status == true) {
            isBack = true;
            notifyListeners();
          }
        });
      loading = false;
      notifyListeners();

  }
}
