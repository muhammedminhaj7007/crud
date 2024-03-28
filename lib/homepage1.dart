import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/colorconstant.dart';
import 'package:crud/homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mdi_icons/flutter_mdi_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'adduser.dart';
import 'edituser.dart';
import 'getpage.dart';
import 'imageconstant.dart';
import 'loginscreen1.dart';
import 'main.dart';

class HoMePage1 extends StatefulWidget {
  const HoMePage1({super.key});

  @override
  State<HoMePage1> createState() => _HoMePage1State();
}

class _HoMePage1State extends State<HoMePage1> {
  // List listview=[
  //   {
  //     "list":Imagepage.img10,
  //     "list2":"Albert Flores",
  //     "list3":"1901 Thornridge Cir. Shiloh, Hawaii",
  //     "list4":Imagepage.delete,
  //     "list5":Mdi.pencil
  //
  //   },
  //   {
  //     "list":Imagepage.img10,
  //     "list2":"Albert Flores",
  //     "list3":"1901 Thornridge Cir. Shiloh, Hawaii",
  //     "list4":Imagepage.delete,
  //     "list5":Mdi.pencil
  //
  //   },
  //   {
  //     "list":Imagepage.img10,
  //     "list2":"Albert Flores",
  //     "list3":"1901 Thornridge Cir. Shiloh, Hawaii",
  //     "list4":Imagepage.delete,
  //     "list5":Mdi.pencil
  //
  //   }, {
  //     "list":Imagepage.img10,
  //     "list2":"Albert Flores",
  //     "list3":"1901 Thornridge Cir. Shiloh, Hawaii",
  //     "list4":Imagepage.delete,
  //     "list5":Mdi.pencil
  //
  //   },
  //   {
  //     "list":Imagepage.img10,
  //     "list2":"Albert Flores",
  //     "list3":"1901 Thornridge Cir. Shiloh, Hawaii",
  //     "list4":Imagepage.delete,
  //     "list5":Mdi.pencil
  //
  //   },
  //   {
  //     "list":Imagepage.img10,
  //     "list2":"Albert Flores",
  //     "list3":"1901 Thornridge Cir. Shiloh, Hawaii",
  //     "list4":Imagepage.delete,
  //     "list5":Mdi.pencil
  //
  //   },
  //   {
  //     "list":Imagepage.img10,
  //     "list2":"Albert Flores",
  //     "list3":"1901 Thornridge Cir. Shiloh, Hawaii",
  //     "list4":Imagepage.delete,
  //     "list5":Mdi.pencil
  //
  //   },
  //   {
  //     "list":Imagepage.img10,
  //     "list2":"Albert Flores",
  //     "list3":"1901 Thornridge Cir. Shiloh, Hawaii",
  //     "list4":Imagepage.delete,
  //     "list5":Mdi.pencil
  //
  //   },
  //   {
  //     "list":Imagepage.img10,
  //     "list2":"Albert Flores",
  //     "list3":"1901 Thornridge Cir. Shiloh, Hawaii",
  //     "list4":Imagepage.delete,
  //     "list5":Mdi.pencil
  //
  //   },
  //   {
  //     "list":Imagepage.img10,
  //     "list2":"Albert Flores",
  //     "list3":"1901 Thornridge Cir. Shiloh, Hawaii",
  //     "list4":Imagepage.delete,
  //     "list5":Mdi.pencil
  //
  //   },
  //
  // ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddUser(),
              ));
        },
        backgroundColor: colorpage.darkblue,
        child: Icon(Icons.add),
        shape: CircleBorder(),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: colorpage.white,
        // leading: InkWell(
        //   onTap: () {
        //     Navigator.pop(context);
        //   },
        //   child: const Icon(
        //     Icons.arrow_back_ios,
        //     color: Colors.black,
        //   ),
        // ),
        title: Text(
          "Hello, User",
          style: TextStyle(color: colorpage.black),
        ),
        actions: [
          Row(
            children: [
              Image.asset(Imagepage.img5, width: width * 0.12),
              SizedBox(width: width * 0.03),
              InkWell(
                onTap: () {
                  GoogleSignIn().signOut();
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => HomePage(),
                      ));
                  setState(() {});
                },
                child: Icon(
                  Mdi.logout,
                  color: colorpage.black,
                  size: width * 0.10,
                ),
              )
            ],
          ),
        ],
      ),
      backgroundColor: colorpage.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(width * 0.03),
                child: Row(
                  children: [
                    Text(
                      "Current Users",
                      style: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: width * 0.06),
                    ),
                  ],
                ),
              ),
              // StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
              //   stream: FirebaseFirestore.instance
              //       .collection("users")
              //       .doc("imbghus")
              //       .snapshots(),
              //   builder: (context, snapshot) {
              //     if (!snapshot.hasData) {
              //       return Center(child: CircularProgressIndicator());
              //     }
              //     var data = snapshot.data!.data();
              //     return Column(
              //       children: [Text(data!["name"]), Text(data["email"])],
              //     );
              //   },
              // ),
              Container(
                // color: Colors.red,
                height: width * 2.6,
                width: width * 1,
                child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                    stream: FirebaseFirestore.instance
                        .collection("users")
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Center(child: CircularProgressIndicator());
                      }
                      List data = snapshot.data!.docs;
                      return ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding( 
                              padding: EdgeInsets.all(width * 0.03),
                              child: InkWell(
                                onTap: () {
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //       builder: (context) => GetPage(
                                  //         id: data[index].id,
                                  //       ),
                                  //     ));
                                },
                                child: Container(
                                  height: width * 0.2,
                                  width: width * 0.33,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(width * 0.04),
                                      color: colorpage.grey),
                                  child: ListTile(
                                    leading: CircleAvatar(
                                      radius: width*0.08,
                                      backgroundImage: NetworkImage(data[index]["image"]),
                                    ),
                                    title: Row(
                                      children: [
                                        Text(
                                          data[index]["name"],
                                          style: TextStyle(
                                              fontSize: width * 0.03,
                                              fontWeight: FontWeight.w600),
                                        )
                                      ],
                                    ),
                                    subtitle: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          data[index]["email"],
                                          style:
                                              TextStyle(fontSize: width * 0.03),
                                        )
                                      ],
                                    ),
                                    trailing: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        InkWell(
                                            onTap: () {
                                              showCupertinoModalPopup(
                                                context: context,
                                                builder: (context) {
                                                  return CupertinoAlertDialog(
                                                    title: Text(
                                                        "Are you sure\nYou want to delete User"),
                                                    actions: [
                                                      Column(
                                                        children: [
                                                          CupertinoDialogAction(
                                                            onPressed: () {
                                                              FirebaseFirestore.instance.collection("users").doc(data[index]["password"]).delete();
                                                              Navigator.pop(context);
                                                            },
                                                            child: Text(
                                                              "Yes",
                                                              style: TextStyle(
                                                                  color:
                                                                      colorpage
                                                                          .red,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            ),
                                                          ),
                                                          Divider(
                                                            color:
                                                                colorpage.black,
                                                          ),
                                                          CupertinoDialogAction(
                                                            child: Text(
                                                                "Cancel",
                                                                style: TextStyle(
                                                                    color:
                                                                        colorpage
                                                                            .blue,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500)),
                                                          )
                                                        ],
                                                      )
                                                    ],
                                                  );
                                                },
                                              );
                                            },
                                            child: SvgPicture.asset(
                                                Imagepage.delete)),
                                        SizedBox(
                                          width: width * 0.02,
                                        ),
                                        InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        EditUser(
                                                      id: data[index]["email"],
                                                      name: data[index]["name"],
                                                      email: data[index]["email"],
                                                      password: data[index]["password"],
                                                            image:data[index]["image"]
                                                    ),
                                                  ));
                                            },
                                            child: Container(
                                              height: width * 0.08,
                                              width: width * 0.08,
                                              // color: Colors.green,
                                              child: Icon(
                                                Mdi.pencil,
                                                color: colorpage.darkblue,
                                              ),
                                            ))
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: width * 0.0001,
                            );
                          },
                          itemCount: data.length);
                    }),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
