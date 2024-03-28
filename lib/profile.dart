import 'dart:io';

import 'package:crud/colorconstant.dart';
import 'package:crud/homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mdi_icons/flutter_mdi_icons.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

import 'imageconstant.dart';
import 'main.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  bool a=false;

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
              "Profile",
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
                ),SizedBox(
                  height: height*0.03,
                ),
                Padding(
                  padding: EdgeInsets.only(left: width * 0.05, right: width * 0.05),
                  child: Container(
                    height: height * 0.4,
                    // color: Colors.blue,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextFormField(
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
                          keyboardType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.next,
                          obscureText: a,
                          obscuringCharacter: "*",
                          decoration: InputDecoration(
                            suffixIcon: Padding(
                              padding: EdgeInsets.only(right: width * 0.05),
                              child: InkWell(
                                onTap: () {
                                  a=!a;
                                  setState(() {

                                  });
                                },
                                  child: Icon(a?Mdi.lockOutline:Mdi.lockOpen)),
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
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: height*0.04,
                ),
                InkWell(
                  onTap: () {
                    showCupertinoModalPopup(context: context, builder:  (context) {
                      return CupertinoAlertDialog(
                        title: Text("Are you sure\nYou Want to Update Details?"),
                        actions: [
                          Column(
                            children: [
                              Container(
                               child: CupertinoDialogAction(child: Text("Confirm",style: TextStyle(color: colorpage.blue,fontWeight: FontWeight.w500),),
                                 onPressed: () {
                                   Navigator.push(context, CupertinoPageRoute(builder: (context) => HomePage(),));
                                 },
                                   )),
                              Divider(
                                color: colorpage.black,
                              ),
                              CupertinoDialogAction(child: Text("Cancel",style: TextStyle(color: colorpage.red,fontWeight: FontWeight.w500))
                                ,onPressed: (
                                    ) {
                                  Navigator.pop(context);
                                },)
                            ],
                          )
                        ],
                      );
                    },);
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
                          "Update",
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

        ));
  }
}
