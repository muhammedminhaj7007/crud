import 'package:crud/colorconstant.dart';
import 'package:crud/homepage.dart';
import 'package:crud/loginscreen1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen> {
  bool login =false;
  getData()async{
    SharedPreferences _min= await SharedPreferences.getInstance();
    login=_min.getBool("login")??false;
    Future.delayed(Duration(seconds: 3))
    .then((value) => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => login==true?HomePage():LoginScreen1())));
  }
  @override
  void initState() {
    getData();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: colorpage.darkblue,
      body: Center(
        child: Text(
          "CRUD",
          style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: width * 0.1,
              color: colorpage.white),
        ),
      ),
    ));
  }
}
