import 'package:flutter/material.dart';
import 'package:rolebase/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

String email = "";
String age = "";
String type = "";

class _SignUpState extends State<SignUp> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    email = sp.getString("email") ?? "";
    age = sp.getString("age") ?? "";
    type = sp.getString("type") ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("Logout"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                child: Row(
                  children: [
                    Text("Email  $email"),
                    SizedBox(
                      width: 80,
                    ),
                    Text("Age ${age.toString()}"),
                    // Text(type),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () async {
                SharedPreferences sp = await SharedPreferences.getInstance();
                sp.clear();

                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ));
              },
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.teal,
                  ),
                  child: Center(
                      child: Text(
                    "Logout",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  )),
                ),
              ),
            )
            // const Text("Welcome to My App"),
          ],
        ));
  }
}
