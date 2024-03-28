import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/colorconstant.dart';
import 'package:crud/imageconstant.dart';
import 'package:crud/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'cart_task2.dart';

class cart_task1 extends StatefulWidget {
  const cart_task1({super.key});

  @override
  State<cart_task1> createState() => _cart_task1State();
}

class _cart_task1State extends State<cart_task1> {
  @override
  void initState() {
    // demo();
    super.initState();
  }

  var file;

  picimage(ImageSource source) async {
    final pickedFile =
        await ImagePicker.platform.getImageFromSource(source: source);
    file = File(pickedFile!.path);
    if (mounted) {
      file = File(pickedFile.path);
      setState(() {});
    }
  }

  List sublist = [];

  // demo() async {
  //   DocumentReference doc = FirebaseFirestore.instance.collection('users').doc();
  //   await doc.set({
  //     'name': "danish k.t",
  //     "id": doc.id
  //   });
  //
  //   print("second");
  // }

  // demo() async {
  //   DocumentReference doc = FirebaseFirestore.instance.collection('users').doc();
  //   await doc.set({
  //     'name': "danish kt abbas6",
  //   });
  // }

  // demo() async {
  //   DocumentReference doc = FirebaseFirestore.instance.collection('users')
  //       .doc("dani");
  //   await doc.set({
  //     'name': "danish",
  //     "id": doc.id
  //   });
  // }

  // demo() async {
  //   DocumentReference doc =FirebaseFirestore.instance.collection('users').doc();
  //   await doc.set({
  //     'name':"danish",
  //     "id":doc.id
  //   });
  //   await Future.delayed(const Duration(seconds: 5));
  //   print("second");
  // }

  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController QuantityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: height * 0.9,
              width: width * 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Center(
                  //   child: Container(
                  //     height: height * 0.3,
                  //     width: width * 0.5,
                  //     decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(width * 0.03),
                  //         image: DecorationImage(
                  //             image: AssetImage(
                  //               Imagepage.sheos,
                  //             ),
                  //             fit: BoxFit.fill)),
                  //   ),
                  // ),
                  Center(
                      child: file == null
                          ? Container(
                              height: height * 0.15,
                              width: width * 0.4,
                              child:  Image.network(
                                  "https://images.unsplash.com/photo-1542291026-7eec264c27ff?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c2hvZXN8ZW58MHx8MHx8fDA%3D",
                                fit: BoxFit.fill,
                              ))
                          : Container(
                              height: height * 0.15,
                              width: width * 0.4,
                              child: Image(
                                image: FileImage(
                                  file,
                                ),
                                fit: BoxFit.fill,
                              ))),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          picimage(ImageSource.gallery);
                        },
                        child: Container(
                          width: width * 0.05,
                          height: width * 0.05,
                          child: Icon(Icons.photo),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          picimage(ImageSource.camera);
                        },
                        child: Container(
                          width: width * 0.05,
                          height: width * 0.05,
                          child: Icon(Icons.camera_enhance),
                        ),
                      )
                    ],
                  ),

                  Padding(
                    padding: EdgeInsets.all(width * 0.05),
                    child: Container(
                      width: width * 0.5,
                      height: width * 0.13,
                      decoration: BoxDecoration(
                        // border: Border.all(color: Colorconst.primarycolor),
                        // borderRadius:
                        color: colorpage.white,
                      ),
                      child: TextFormField(
                          controller: nameController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.newline,
                          decoration: InputDecoration(
                            label: Text(
                              " Name",
                              style: TextStyle(
                                  color: colorpage.black,
                                  fontSize: width * 0.05),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(width * 0.04),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(width * 0.04),
                            ),
                          )),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(width * 0.05),
                    child: Container(
                      width: width * 0.5,
                      height: width * 0.13,
                      decoration: BoxDecoration(
                        // border: Border.all(color: Colorconst.primarycolor),
                        // borderRadius:
                        color: colorpage.white,
                      ),
                      child: TextFormField(
                          controller: priceController,
                          keyboardType: TextInputType.phone,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          textInputAction: TextInputAction.newline,
                          decoration: InputDecoration(
                            label: Text(
                              "Price",
                              style: TextStyle(
                                  color: colorpage.black,
                                  fontSize: width * 0.05),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(width * 0.04),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(width * 0.04),
                            ),
                          )),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(width * 0.05),
                    child: Container(
                      width: width * 0.5,
                      height: width * 0.13,
                      decoration: BoxDecoration(
                        // border: Border.all(color: Colorconst.primarycolor),
                        // borderRadius:
                        color: colorpage.white,
                      ),
                      child: TextFormField(
                          controller: QuantityController,
                          keyboardType: TextInputType.phone,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          textInputAction: TextInputAction.newline,
                          decoration: InputDecoration(
                            label: Text(
                              "Quantity",
                              style: TextStyle(
                                  color: colorpage.black,
                                  fontSize: width * 0.05),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(width * 0.04),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(width * 0.04),
                            ),
                          )),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      if (nameController.text != "" &&
                          priceController.text != "" &&
                          QuantityController.text != "") {
                        sublist.add({
                          "name": nameController.text,
                          "price": priceController.text,
                          "Quantity": QuantityController
                        });
                        print(sublist);
                        sublist.length == 1
                            ? Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => cart_task2(
                                    sub: sublist,
                                  ),
                                ),
                              )
                            : nameController.clear();
                        priceController.clear();
                        QuantityController.clear();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("please enter 5 sublist")));
                      }
                    },
                    child: Container(
                      height: width * 0.13,
                      width: width * 0.4,
                      decoration: BoxDecoration(
                        color: colorpage.black,
                        borderRadius: BorderRadius.circular(width * 0.06),
                      ),
                      child: const Center(
                        child: Text(
                          "submit",
                          style: TextStyle(
                              color: colorpage.white,
                              fontWeight: FontWeight.w600),
                        ),
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
