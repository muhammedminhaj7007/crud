import 'dart:convert';

import 'package:crud/colorconstant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mdi_icons/flutter_mdi_icons.dart';
import 'package:http/http.dart' as http;

import 'main.dart';

class ApiPage extends StatefulWidget {
  const ApiPage({super.key});

  @override
  State<ApiPage> createState() => _ApiPageState();
}

class _ApiPageState extends State<ApiPage> {

  String link="https://reqres.in/api/users?page=2";
  http.Response ? a;

  Map<String,dynamic>data={

  };

  List users=[];


  getApiData() async {
    // String b="10";
    // int c=int.tryParse(b) ?? 0;
    a= await http.get(Uri.tryParse(link)!);
    print (a!.statusCode);
    // print(a!.body);
    data=json.decode(a!.body);
    // print(data);

    if(a != null){
      users = data["data"];
      print(users);
      setState(() {

      });
    }

  }

  @override
  void initState() {
    getApiData();
    // TODO: implement initState
    super.initState();
  }

  List listview=[
    {
      "list":"Postoffice : Perinthalmanna",
      "list1":"Pincode : 679322"
    },
    {
      "list":"Postoffice : Perinthalmanna",
      "list1":"Pincode : 679322"
    },
    {
      "list":"Postoffice : Perinthalmanna",
      "list1":"Pincode : 679322"
    },
    {
      "list":"Postoffice : Perinthalmanna",
      "list1":"Pincode : 679322"
    },
    {
      "list":"Postoffice : Perinthalmanna",
      "list1":"Pincode : 679322"
    },{
      "list":"Postoffice : Perinthalmanna",
      "list1":"Pincode : 679322"
    },
    {
      "list":"Postoffice : Perinthalmanna",
      "list1":"Pincode : 679322"
    },
    {
      "list":"Postoffice : Perinthalmanna",
      "list1":"Pincode : 679322"
    },
    {
      "list":"Postoffice : Perinthalmanna",
      "list1":"Pincode : 679322"
    },

  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:
        Scaffold(
          appBar: AppBar(
            centerTitle: true,
            leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
            ),
            title: Text(
              "Postal Codes",
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
            physics:BouncingScrollPhysics(),
            child: Column(
              children: [
                Padding(
                  padding:  EdgeInsets.all(width*0.03),
                  child: SizedBox(
                    height: width*0.15,
                    width: width*0.95,
                    child: TextFormField(
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search_rounded,
                          color: colorpage.blue,
                        ),
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
                  ),
                ),
                SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Container(
                        height: width*1.8,
                        width: width*1,
                        // color: Colors.red,
                        child: ListView.separated(
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:  EdgeInsets.only(left: width*0.03,right: width*0.03),
                                child: ListTile(
                                  tileColor: colorpage.grey,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(width*0.03)),
                                  title:Text("ID:${users[index]["id"]}"),
                                  subtitle:Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("NAME:${users[index]["first_name"]} ${users[index]["last_name"]}"),
                                      Text("EMAIL:${users[index]["email"]}"),
                                    ],
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                height: height*0.02,
                              );
                            },
                            itemCount:users.length),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
