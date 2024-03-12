import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import '../widget/utils_widget.dart';

class LoginService {
  Future<void> login(String phone,String password) async {
    String url = 'https://demo.zfcourier.xyz/api/v/1.0.0/auth/login';
    Map<String, String> headers = {'Content-Type': 'application/json'};
    Map<String, String> body = {
      'phone': phone,
      'password': password,
    };

    try {
      http.Response response =
      await http.post(Uri.parse(url), headers: headers, body: jsonEncode(body));
      if (response.statusCode == 200) {
        // Handle successful login, e.g., store user token or navigate to next screen
        print('Login successful');
      } else {
        // Handle login failure, e.g., show error message
        print('Login failed: ${response.body}');
      }
    } catch (error) {
      print('Error during login: $error');
    }
  }
}