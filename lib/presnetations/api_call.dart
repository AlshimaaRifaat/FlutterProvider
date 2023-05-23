
import 'dart:convert';

import 'package:flutter_provider/models/sign_in_model.dart';
import 'package:flutter_provider/utils/constants.dart';
import 'package:http/http.dart' as http;

class APICall {
  Future<http.Response> signIn(SignInBody body) async {
    Map<String, String> headers = {'Content-Type': 'application/json'};
    return await http.post(
        Uri.parse(Constants.signIn),
        body: jsonEncode(body.toJson()),
        headers: headers);
  }
}