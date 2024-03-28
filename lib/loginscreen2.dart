import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/colorconstant.dart';
import 'package:crud/homepage.dart';
import 'package:crud/homepage1.dart';
import 'package:crud/phone.dart';
import 'package:crud/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'imageconstant.dart';
import 'main.dart';

class LoginScreen2 extends StatefulWidget {
  const LoginScreen2({super.key});

  @override
  State<LoginScreen2> createState() => _LoginScreen2State();
}

var UserName;
var UserEmail;
var Userimage;


class _LoginScreen2State extends State<LoginScreen2> {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  googleSignInFunction() async {

    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    var userCredential = await FirebaseAuth.instance.signInWithCredential(credential);

    User? user= userCredential.user;

    print(user!.email);
    print(user!.displayName);
    print(user!.photoURL);

    Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) => HomePage(),));

  }

  Future<User?> _handleSignIn() async {
    try {
      GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount!.authentication;

      AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      UserCredential authResult = await _auth.signInWithCredential(credential);
      User? user = authResult.user;

      return user;
    } catch (error) {
      print(error);
      return null;
    }
  }

  void _handleSignOut() async {
    await googleSignIn.signOut();
    print("User signed out");
  }



  loginUsingGetMethod() async {
    var data= await FirebaseFirestore.instance.collection("users").where("email",isEqualTo: usernamecontroller.text).get();
    print(data.docs);

    if(data.docs.isNotEmpty){
      if(data.docs[0]["password"]!=passwordcontroller.text){
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HoMePage1(),), (route) => false);
      }else{
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: colorpage.darkblue,content: Text("Passwords do not match",
          style: TextStyle(fontSize: width*0.04,fontWeight: FontWeight.w500),
        )));
      }
    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: colorpage.darkblue,content: Text("No account found",
        style: TextStyle(fontSize: width*0.04,fontWeight: FontWeight.w500),
      )));
    }
  }

  loginUsingAuth(){
    FirebaseAuth.instance.signInWithEmailAndPassword(email: usernamecontroller.text, password: passwordcontroller.text)
        .then((value) {

      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ));
    }).catchError((error){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error.code.toString())));
    });
  }

  setData() async {
    SharedPreferences _min = await SharedPreferences.getInstance();
    _min.setBool("login", true);
  }
  //
  // final formKey = GlobalKey<FormState>();
  //
  // final passwordValidation =
  //     RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  // final userValidation =
  //     RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?).{8,}$');

  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController usernamecontroller = TextEditingController();

  bool a = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(
          "CRUD",
          style: TextStyle(
            color: colorpage.black,
            fontSize: width * 0.05,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: colorpage.white,
        elevation: 0,
      ),
      backgroundColor: colorpage.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child:
        Form(
          // key: formKey,
          child: Column(children: [
            Image.asset(
              Imagepage.img2,
            ),
            SizedBox(
              height: height * 0.02,
            ),
            TextFormField(
              controller: usernamecontroller,
              keyboardType: TextInputType.emailAddress,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              // validator: (value) {
              //   if (!userValidation.hasMatch(value!)) {
              //     return "Enter your name";
              //   } else {
              //     return null;
              //   }
              // },
              decoration: InputDecoration(
                  labelText: "Username",
                  constraints: BoxConstraints(maxWidth: width * 0.9),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: colorpage.darkblue),
                    borderRadius: BorderRadius.circular(width * 0.03)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: colorpage.darkblue),
                    borderRadius: BorderRadius.circular(width * 0.03)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(width * 0.03),
                    borderSide: BorderSide(color: colorpage.darkblue)),
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            TextFormField(
              controller: passwordcontroller,
              keyboardType: TextInputType.visiblePassword,
              obscureText: a ? false : true,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              // validator: (value) {
              //   if (!passwordValidation.hasMatch(value!)) {
              //     return "Password must contain,\n1 Uppercase,(A-Z)\n1 Lowercase,(a-z)\n 1 Number(1 to 10),\n 1 Special character(@,%,*,!)";
              //   } else {
              //     return null;
              //   }
              // },
              decoration: InputDecoration(
                suffixIcon: InkWell(
                    onTap: () {
                      a = !a;
                      setState(() {});
                    },
                    child: Icon(a ? Icons.visibility : Icons.visibility_off)),
                labelText: "Password",
                constraints: BoxConstraints(maxWidth: width * 0.9),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: colorpage.darkblue),
                    borderRadius: BorderRadius.circular(width * 0.03)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: colorpage.darkblue),
                    borderRadius: BorderRadius.circular(width * 0.03)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(width * 0.03),
                    borderSide: BorderSide(color: colorpage.darkblue)),
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            SizedBox(
              height: width * 0.55,
              width: width * 0.8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () async {
                      setData();

                      loginUsingAuth();


                       // if (formKey.currentState!.validate()) {
                      //   Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                      // } else {
                      //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("enter your valid Details")));
                      // }
                    },
                    child: Container(
                      height: width * 0.15,
                      width: width * 0.70,
                      decoration: BoxDecoration(
                          border: Border.all(color: colorpage.darkblue),
                          borderRadius: BorderRadius.circular(width * 0.09)),
                      child: Row(
                        children: [
                          SizedBox(
                              height: width * 0.09,
                              width: width * 0.15,
                              child: Icon(
                                Icons.lock_outline,
                                color: colorpage.darkblue,
                              )),
                          Center(
                            child: SizedBox(
                              height: width * 0.09,
                              width: width * 0.43,
                              child: Center(
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                      color: colorpage.darkblue,
                                      fontWeight: FontWeight.w500,
                                      fontSize: width * 0.04),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      googleSignInFunction();
                      // User? user = await _handleSignIn();
                      // if (user != null) {
                      //   print("Signed in: ${user.displayName}");
                      // }
                      },
                    child: Container(
                      height: width * 0.15,
                      width: width * 0.70,
                      decoration: BoxDecoration(
                          border: Border.all(color: colorpage.darkblue),
                          borderRadius: BorderRadius.circular(width * 0.09)),
                      child: Row(
                        children: [
                          SizedBox(
                              height: width * 0.09,
                              width: width * 0.15,
                              child: SvgPicture.asset(Imagepage.google)),
                          Center(
                            child: SizedBox(
                              height: width * 0.09,
                              width: width * 0.43,
                              child: Center(
                                child: Text(
                                  " Sign in with Google",
                                  style: TextStyle(
                                      color: colorpage.darkblue,
                                      fontWeight: FontWeight.w500,
                                      fontSize: width * 0.04),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Phone(),
                          ));
                      setState(() {});
                    },
                    child: Container(
                      height: width * 0.15,
                      width: width * 0.70,
                      decoration: BoxDecoration(
                          border: Border.all(color: colorpage.darkblue),
                          borderRadius: BorderRadius.circular(width * 0.09)),
                      child: Row(
                        children: [
                          SizedBox(
                              height: width * 0.09,
                              width: width * 0.15,
                              child: SvgPicture.asset(Imagepage.callicon)),
                          Center(
                            child: SizedBox(
                              height: width * 0.09,
                              width: width * 0.43,
                              child: Center(
                                child: Text(
                                  "OTP sign in",
                                  style: TextStyle(
                                      color: colorpage.darkblue,
                                      fontWeight: FontWeight.w500,
                                      fontSize: width * 0.04),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: width * 0.13,
            ),
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: "Don’t have an account ? ",
                  style: TextStyle(color: colorpage.darkblue)),
              TextSpan(
                  text: "Create",
                  style: TextStyle(
                      color: colorpage.darkblue,
                      fontSize: width * 0.04,
                      fontWeight: FontWeight.w600))
            ]))
          ]),
        ),
      ),
    ));
  }
}
