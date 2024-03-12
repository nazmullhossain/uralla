import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_project_today/pages/home_pages.dart';
import 'package:task_project_today/pages/login_pages.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
var token="";
getToken()async{
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  token=await prefs.getString("token")??"";
}
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getToken();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:token.isEmpty? LoginScreen():HomePage(),
    );
  }
}
