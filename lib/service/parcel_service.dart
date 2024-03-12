import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_project_today/widget/utils_widget.dart';

class ParcelService{
   updateParcel( BuildContext context, Map<String,dynamic>data,String id) async {
    final String url = 'https://demo.zfcourier.xyz/api/v/1.0.0/parcels/update/64f8b452c6845cac6ded3076';
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'x-auth-token': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NDdkYzEyODAxMjA3YjBmYTE3MGUzYWEiLCJyb2xlIjp7Il9pZCI6IjY0NGI2MDA0MGYyM2NiMjlmYzg3ZDA0NiIsImFsaWFzIjoiTUVSQ0hBTlQiLCJwZXJtaXNzaW9uU3RyaW5nIjoiXHUwMDAxcCAgMDBcdTAwMDZcZjJHYFx1MDAwNlx1MDAwMFx1MDAwMFx1MDAwMlx1MDAwN1x1MDAwMFx1MDAwMUBcdTAwMDBcdTAwMDBcdTAwMDBcdTAwMDAiLCJfX3YiOjB9LCJwZXJtaXNzaW9uU3RyaW5nIjoiXHUwMDAxcCAgMDBcdTAwMDZcZjJHYFx1MDAwNlx1MDAwMFx1MDAwMFx1MDAwMlx1MDAwN1x1MDAwMFx1MDAwMUBcdTAwMDBcdTAwMDBcdTAwMDBcdTAwMDBcdTAwMDAiLCJpc1NlbGxlciI6dHJ1ZSwicGhvbmUiOiI4ODAxNjI3NTYxNTU2IiwiZnVsbE5hbWUiOiJOYWZpdWwgSXNsYW0iLCJlbWFpbCI6Im5pbmFkbmFmaXVsQGdtYWlsLmNvbSIsImlhdCI6MTcxMDIxMzY5NX0.SdpDsx6E6M0U8S7hpPTV2M4qHQYIOjD2AmbqgxgThjk',
    };
    // final Map<String, dynamic> data = {
    //
    //   "recipientName": recipientName,
    //   "recipientPhone": recipientPhone,
    //   "recipientCity": recipientCity,
    //
    // };

    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final response = await http.put(
        Uri.parse(url),
        headers: {'x-auth-token': prefs.getString('token') ?? ""},
        body: data,
      );
      print("update parcel ${response.body}");

      if (response.statusCode == 200) {
        print('Request successful');
        showSnackBar(context, "Request successful");
        print(response.body);
      } else {
        print('Request failed with status: ${response.statusCode}');
        showSnackBar(context, "Request unsuccessful");
      }
    } catch (e) {
      print('Exception: $e');
    }
  }
}
