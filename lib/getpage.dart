import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/colorconstant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class GetPage extends StatefulWidget {
  final String id;
  const GetPage({super.key, required this.id});
  @override
  State<GetPage> createState() => _GetPageState();
}

class _GetPageState extends State<GetPage> {

  List GetCollection = [];

  Map<String,dynamic> GetDocument={};

  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
        Scaffold(
      backgroundColor: colorpage.white,
      body:
      SingleChildScrollView(
        child:
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: height*0.04,
            ),
            InkWell(
              onTap: () async {
                QuerySnapshot<Map<String, dynamic>> getdata =
                    await FirebaseFirestore.instance.collection("users").get();
                GetCollection = getdata.docs;

                DocumentSnapshot<Map<String,dynamic>>docdata=
               await FirebaseFirestore.instance.collection("users").doc(widget.id).get();
                GetDocument=docdata.data()!;

                setState(() {

                });
              },
              child: CircleAvatar(
                backgroundColor: colorpage.darkblue,
                radius: width * 0.10,
                child: Text(
                  "GET",
                  style: TextStyle(
                      color: colorpage.white, fontWeight: FontWeight.w900),
                ),
              ),
            ),
            SizedBox(
              height: height*0.04,
            ),
            Container(
              height: width*0.15,
              width: width*0.9,
              decoration: BoxDecoration(
                  color: colorpage.darkblue,
                borderRadius:BorderRadius.circular(width*0.03)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(GetDocument["name"] ?? "" ,style: TextStyle(
                    color: colorpage.white
                  ), ),
                  Text(GetDocument["email"] ?? "" ,style: TextStyle(
                      color: colorpage.white
                  ), ),
                ],
              ),
            ),
            SizedBox(
              height: height*0.04,
            ),
            Container(
              height: width*1.5,
              width: width*1,
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:  EdgeInsets.only(left: width*0.03,right: width*0.03),
                      child: ListTile(
                        tileColor: colorpage.grey,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(width*0.03)),
                        subtitle:Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(GetCollection[index]["name"]),
                            Text(GetCollection[index]["email"]),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: height*0.03,
                    );
                  },
                  itemCount:GetCollection.length),
            ),
          ],
        ),
      ),
    ));
  }
}
