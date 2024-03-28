import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/colorconstant.dart';
import 'package:crud/homepage1.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mdi_icons/flutter_mdi_icons.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

import 'imageconstant.dart';
import 'main.dart';

class EditUser extends StatefulWidget {
  final String id;
  final String name;
  final String email;
  final String password;
  final String image;
  const EditUser(
      {
        super.key,
        required this.name,
      required this.email,
      required this.password,
      required this.id, required this.image
      });

  @override
  State<EditUser> createState() => _EditUserState();
}

class _EditUserState extends State<EditUser> {

  bool a = false;
  bool b = false;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Map<String, dynamic> GetDocument = {};

  File? file;

  String imgurl="";

  pickimage(ImageSource source) async {
    var PickedFile =
        await ImagePicker.platform.getImageFromSource(source: source);
    file = File(PickedFile!.path);
    if (mounted) {
      file = File(PickedFile.path);
      setState(() {});
    }
    uploadFile();
  }
  uploadFile()async{
    String format = file!.path.split('.').last;
    var uploadTask = await FirebaseStorage.instance
        .ref('uploads/images').child(DateTime.now().toString())
        .putFile(file!,SettableMetadata(
        contentType: 'image/$format'
    ));
    var getUrl = await uploadTask.ref.getDownloadURL();

    imgurl = getUrl;
    setState(() {

    });

    print(getUrl);
  }

  @override
  void initState() {
    // TODO: implement initState
    nameController.text = widget.name;
    emailController.text = widget.email;
    passwordController.text = widget.password;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
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
        title: Text(
          "Edit User",
          style: TextStyle(
            color: colorpage.black,
            fontSize: width * 0.05,
            fontWeight: FontWeight.w600,
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
                            backgroundImage: NetworkImage(widget.image))
                        : CircleAvatar(
                            radius: width * 0.2,
                            backgroundImage: NetworkImage(imgurl),
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
                                    child: Text(
                                      "Photo Gallery",
                                      style: TextStyle(color: Colors.blue),
                                    )),
                                CupertinoActionSheetAction(
                                    onPressed: () {
                                      pickimage(ImageSource.camera);
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      "Camera",
                                      style: TextStyle(color: Colors.blue),
                                    )),
                              ],
                              cancelButton: CupertinoActionSheetAction(
                                onPressed: () {
                                  Navigator.pop(context);
                                  setState(() {});
                                },
                                child: Text(
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
                                setState(() {});
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
                                setState(() {});
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
                      showCupertinoModalPopup(
                        context: context,
                        builder: (context) {
                          return CupertinoAlertDialog(
                            title: Text(
                                "Are you sure\nYou Want to Update Details?"),
                            actions: [
                              Column(
                                children: [
                                  CupertinoDialogAction(
                                    onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => HoMePage1()));
                                      FirebaseFirestore.instance.collection("users").doc(widget.password).update({
                                        "name":nameController.text,
                                        "email":emailController.text,
                                        "password":passwordController.text,
                                        "image":imgurl,

                                      });
                                    },
                                    child: Text(
                                      "Confirm",
                                      style: TextStyle(
                                          color: colorpage.blue,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  Divider(
                                    color: colorpage.black,
                                  ),
                                  CupertinoDialogAction(
                                    child: Text("Cancel",
                                        style: TextStyle(
                                            color: colorpage.red,
                                            fontWeight: FontWeight.w500)),
                                    onPressed: () {
                                      Navigator.pop(context);
                                      setState(() {

                                      });
                                    },
                                  )
                                ],
                              )
                            ],
                          );
                        },
                      );
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
                            "Edit User",
                            style: TextStyle(
                              color: colorpage.darkblue,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
