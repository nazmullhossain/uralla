import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_project_today/widget/utils_widget.dart';

class ParcelService{
   updateParcel( BuildContext context, Map<String,dynamic>data,String id) async {
     final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String url = 'https://demo.zfcourier.xyz/api/v/1.0.0/parcels/update/$id';
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'x-auth-token': prefs.getString('token') ?? ""
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
