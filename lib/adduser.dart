import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/colorconstant.dart';
import 'package:crud/model/model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mdi_icons/flutter_mdi_icons.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

import 'imageconstant.dart';
import 'main.dart';
import 'model/usermodel.dart';

class AddUser extends StatefulWidget {
  const AddUser({super.key});

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  bool a = false;
  bool b = false;

  File? file;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  String imgUrll ='https://e7.pngegg.com/pngimages/799/987/png-clipart-computer-icons-avatar-icon-design-avatar-heroes-computer-wallpaper-thumbnail.png';

  pickimage(ImageSource source) async {
    var PickedFile =
        await ImagePicker.platform.getImageFromSource(source: source);
    if (mounted) {
      file = File(PickedFile!.path);
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

    imgUrll = getUrl;
    setState(() {

    });

    print(getUrl);
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
            "Add User",
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
                      child: CircleAvatar(
                              radius: width * 0.2,
                              backgroundImage: NetworkImage(imgUrll),
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
                padding:
                    EdgeInsets.only(left: width * 0.05, right: width * 0.05),
                child: Container(
                  height: height * 0.5,
                  // color: Colors.blue,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextFormField(
                        controller: name,
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
                              borderRadius:
                                  BorderRadius.circular(width * 0.03)),
                        ),
                      ),
                      TextFormField(
                        controller: email,
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
                              borderRadius:
                                  BorderRadius.circular(width * 0.03)),
                        ),
                      ),
                      TextFormField(
                        controller: password,
                        keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.next,
                        obscureText: b,
                        obscuringCharacter: "*",
                        decoration: InputDecoration(
                          suffixIcon: Padding(
                            padding: EdgeInsets.only(right: width * 0.05),
                            child: InkWell(
                                onTap: () {
                                  b = !b;
                                },
                                child:
                                    Icon(b ? Mdi.lockOutline : Mdi.lockOpen)),
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
                              borderRadius:
                                  BorderRadius.circular(width * 0.03)),
                        ),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.done,
                        obscureText: a,
                        obscuringCharacter: "*",
                        decoration: InputDecoration(
                          suffixIcon: Padding(
                            padding: EdgeInsets.only(right: width * 0.05),
                            child: InkWell(
                                onTap: () {
                                  a = !a;
                                },
                                child:
                                    Icon(a ? Mdi.lockOutline : Mdi.lockOpen)),
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
                              borderRadius:
                                  BorderRadius.circular(width * 0.03)),
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
                        // Map<String, dynamic> data = {
                        //   // "name": name.text,
                        //   // 'image':imgUrll,
                        //   // "email": email.text,
                        //   // "password": password.text
                        // };
                        // FirebaseFirestore.instance.collection("users").add(data);
                        FirebaseFirestore.instance
                            .collection("users")
                            .doc(password.text)
                            .set(UserName(name: name.text, email: email.text, password: password.text).toMap());
                        Navigator.pop(context);

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
                              "Add User",
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
      ),
    );
  }
}
