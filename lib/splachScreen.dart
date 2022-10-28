import 'dart:async';
import 'package:flutter/material.dart';
import 'package:rolebase/login.dart';
import 'package:rolebase/signUp.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplachScreen extends StatefulWidget {
  @override
  _SplachScreenState createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
  @override
  void initState() {
    super.initState();
    isLogin();
  }

  void isLogin() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool isLogin = sp.getBool("isLogin") ?? false;
    if (isLogin) {
      Timer(
          Duration(seconds: 3),
          () => Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => SignUp())));
    } else {
      Timer(
          Duration(seconds: 3),
          () => Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => LoginScreen())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          child: Container(
            child: const Image(
              image: AssetImage("assests/1.jpg"),
              fit: BoxFit.fill,
            ),
          ),
        ),
        // const Text("Welcome to My App"),
      ],
    ));
  }
}
