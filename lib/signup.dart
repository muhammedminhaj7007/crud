import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/colorconstant.dart';
import 'package:crud/imageconstant.dart';
import 'package:crud/loginscreen2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mdi_icons/flutter_mdi_icons.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

import 'homepage.dart';
import 'main.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool a = false;
  bool b = false;

  File? file;

  pickimage(ImageSource source) async {
    var PickedFile =
        await ImagePicker.platform.getImageFromSource(source: source);
    file = File(PickedFile!.path);
    if (mounted) {
      file = File(PickedFile.path);
      setState(() {});
    }
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leading: Container(
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
        ),
        title: Center(
          child: Text(
            "User Registration",
            style: TextStyle(
              color: colorpage.black,
              fontSize: width * 0.05,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        backgroundColor: colorpage.white,
        elevation: 0,
      ),
      backgroundColor: colorpage.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(children: [
                  Center(
                    child: file == null
                        ? CircleAvatar(
                            radius: width * 0.2,
                            backgroundImage: AssetImage(Imagepage.img5))
                        : CircleAvatar(
                            radius: width * 0.2,
                            backgroundImage: FileImage(file!),
                          ),
                  ),
                  Positioned(
                    left: width * 0.30,
                    bottom: width * 0.010,
                    child: InkWell(
                      onTap: () {
                        showCupertinoModalPopup(
                          context: context,
                          builder: (context) {
                            return CupertinoActionSheet(
                              actions: [
                                CupertinoActionSheetAction(
                                    onPressed: () async {
                                      await pickimage(ImageSource.gallery);
                                      Navigator.pop(context);
                                    },
                                    child: const Text(
                                      "Photo Gallery",
                                      style: TextStyle(color: Colors.blue),
                                    )),
                                CupertinoActionSheetAction(
                                    onPressed: () {
                                      pickimage(ImageSource.camera);
                                      Navigator.pop(context);
                                    },
                                    child: const Text(
                                      "Camera",
                                      style: TextStyle(color: Colors.blue),
                                    )),
                              ],
                              cancelButton: CupertinoActionSheetAction(
                                onPressed: () {
                                  Navigator.pop(context);
                                  setState(() {});
                                },
                                child: const Text(
                                  "Cancel",
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: CircleAvatar(
                        backgroundColor: colorpage.darkblue,
                        child: Icon(Mdi.pencil),
                      ),
                    ),
                  ),
                ]),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: width * 0.05, right: width * 0.05),
              child: Container(
                height: height * 0.5,
                // color: Colors.blue,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextFormField(
                      controller: nameController,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        suffixIcon: Padding(
                          padding: EdgeInsets.only(right: width * 0.05),
                          child: SvgPicture.asset(
                            Imagepage.user,
                          ),
                        ),
                        labelText: "Full name",
                        labelStyle: TextStyle(color: colorpage.black),
                        filled: true,
                        fillColor: colorpage.grey,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(width * 0.03),
                            borderSide: BorderSide(color: colorpage.grey)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: colorpage.grey),
                            borderRadius: BorderRadius.circular(width * 0.03)),
                      ),
                    ),
                    TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        suffixIcon: Padding(
                          padding: EdgeInsets.only(right: width * 0.05),
                          child: Icon(Mdi.email),
                        ),
                        labelText: "Valid email",
                        labelStyle: TextStyle(color: colorpage.black),
                        filled: true,
                        fillColor: colorpage.grey,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(width * 0.03),
                            borderSide: BorderSide(color: colorpage.grey)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: colorpage.grey),
                            borderRadius: BorderRadius.circular(width * 0.03)),
                      ),
                    ),
                    TextFormField(
                      controller: passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.next,
                      obscureText: a,
                      obscuringCharacter: "*",
                      decoration: InputDecoration(
                        suffixIcon: Padding(
                          padding: EdgeInsets.only(right: width * 0.05),
                          child: InkWell(
                              onTap: () {
                                a = !a;
                              },
                              child: Icon(a ? Mdi.lockOutline : Mdi.lockOpen)),
                        ),
                        labelText: "Password",
                        labelStyle: TextStyle(color: colorpage.black),
                        filled: true,
                        fillColor: colorpage.grey,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(width * 0.03),
                            borderSide: BorderSide(color: colorpage.grey)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: colorpage.grey),
                            borderRadius: BorderRadius.circular(width * 0.03)),
                      ),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.done,
                      obscureText: b,
                      obscuringCharacter: "*",
                      decoration: InputDecoration(
                        suffixIcon: Padding(
                          padding: EdgeInsets.only(right: width * 0.05),
                          child: InkWell(
                              onTap: () {
                                b = !b;
                              },
                              child: Icon(b ? Mdi.lockOutline : Mdi.lockOpen)),
                        ),
                        labelText: "Confirm Password",
                        labelStyle: TextStyle(color: colorpage.black),
                        filled: true,
                        fillColor: colorpage.grey,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(width * 0.03),
                            borderSide: BorderSide(color: colorpage.grey)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: colorpage.grey),
                            borderRadius: BorderRadius.circular(width * 0.03)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: height * 0.2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                              email: emailController.text,
                              password: passwordController.text)
                          .then((value) {
                        Map<String, dynamic> data = {
                          "name": nameController.text,
                          "email": emailController.text,
                          "password": passwordController.text
                        };
                        // FirebaseFirestore.instance.collection("users").add(data);
                        FirebaseFirestore.instance
                            .collection("users")
                            .doc(passwordController.text)
                            .set(data)
                            .then((value) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomePage(),
                              ));
                        });
                      }).catchError((error) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(error.code.toString())));
                      });
                      setState(() {});

                    },
                    child: Container(
                      height: width * 0.15,
                      width: width * 0.65,
                      decoration: BoxDecoration(
                          border: Border.all(color: colorpage.darkblue),
                          borderRadius: BorderRadius.circular(width * 0.09)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // SizedBox(width: width*0.05,),
                          Text(
                            "Sign Up",
                            style: TextStyle(
                              color: colorpage.darkblue,
                              fontWeight: FontWeight.w500,
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
                            builder: (context) => LoginScreen2(),
                          ));
                      setState(() {});
                    },
                    child: Container(
                      child: RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: "Already have an Account ",
                            style: TextStyle(color: colorpage.black)),
                        TextSpan(
                            text: "Login?",
                            style: TextStyle(
                                color: colorpage.darkblue,
                                fontWeight: FontWeight.w500))
                      ])),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
