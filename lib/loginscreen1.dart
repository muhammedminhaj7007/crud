import 'package:crud/colorconstant.dart';
import 'package:crud/imageconstant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'loginscreen2.dart';
import 'signup.dart';
import 'main.dart';

class LoginScreen1 extends StatefulWidget {
  const LoginScreen1({super.key});

  @override
  State<LoginScreen1> createState() => _LoginScreen1State();
}

class _LoginScreen1State extends State<LoginScreen1> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: colorpage.white,
      body: Column(
        children: [
          SizedBox(
            height: height * 0.95,
            // color: Colors.blue,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  Imagepage.img1,
                ),
                Column(
                  children: [
                    Text(
                      "CRUD",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: colorpage.darkblue,
                          fontSize: width * 0.08),
                    ),
                    SizedBox(
                      height: width * 0.02,
                    ),
                    const Text(
                      "Create, Read, Update ,Delete",
                      style: TextStyle(
                          color: colorpage.darkblue,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (context) => LoginScreen2(),), (route) => false);
                        setState(() {});
                      },
                      child: Container(
                        height: width * 0.15,
                        width: width * 0.70,
                        decoration: BoxDecoration(
                            color: colorpage.darkblue,
                            borderRadius: BorderRadius.circular(width * 0.09)),
                        child: const Center(
                          child: Text(
                            "Login",
                            style: TextStyle(
                                color: colorpage.white,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: width * 0.04,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUp(),
                            ));
                        setState(() {});
                      },
                      child: Container(
                        height: width * 0.15,
                        width: width * 0.70,
                        decoration: BoxDecoration(
                            border: Border.all(color: colorpage.darkblue),
                            borderRadius: BorderRadius.circular(width * 0.09)),
                        child: const Center(
                          child: Text(
                            "Sign up",
                            style: TextStyle(
                                color: colorpage.darkblue,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
