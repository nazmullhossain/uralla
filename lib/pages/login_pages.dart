import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_project_today/widget/utils_widget.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../service/auth_service.dart';
import 'home_pages.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _phoneController =
      TextEditingController(text: "8801627561556");
  TextEditingController _passwordController =
      TextEditingController(text: "123456");
  LoginService loginService = LoginService();


  Future<void> _login() async {
    String url = 'https://demo.zfcourier.xyz/api/v/1.0.0/auth/login';
    Map<String, String> headers = {'Content-Type': 'application/json'};
    // Obtain shared preferences.

    Map<String, String> body = {
      'phone': _phoneController.text.trim(),
      'password': _passwordController.text.trim(),
    };

    try {
      http.Response response = await http.post(Uri.parse(url),
          headers: headers, body: jsonEncode(body));
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString("token", data["token"]);
        print(data["token"]);

        print('Login successful');
        print(response.body);

        showSnackBar(context, "Login successful");

        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => HomePage()));
      } else {
        // Handle login failure, e.g., show error message
        print('Login failed: ${response.body}');

        showSnackBar(context, "Login failed");
      }
    } catch (error) {
      print('Error during login: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                  labelText: 'Phone',
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            SizedBox(height: 12.0),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                  labelText: 'Password',
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _login,
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
