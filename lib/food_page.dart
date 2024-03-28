import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/colorconstant.dart';
import 'package:crud/imageconstant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class food_page extends StatefulWidget {
  const food_page({super.key});

  @override
  State<food_page> createState() => _food_pageState();
}

List F = [
  {
    "list1": Imagepage.noodle,
    "list2": "noodles",
    "list3": Imagepage.star,
    "list4": 159,
    "qty": 0
  },
  {
    "list1": Imagepage.pasta,
    "list2": "pasta",
    "list3": Imagepage.star,
    "list4": 239,
    "qty": 0
  },
  {
    "list1": Imagepage.hyderbadBriyani,
    "list2": "hyderbad \nBriyani",
    "list3": Imagepage.star,
    "list4": 250,
    "qty": 0
  },
  {
    "list1": Imagepage.Shawarmabeefmeatvegetablesandcheese,
    "list2": "cheese \nShawarma",
    "list3": Imagepage.star,
    "list4": 280,
    "qty": 0
  },
  {
    "list1": Imagepage.burger,
    "list2": "Burger&Cold \nDrink",
    "list3": Imagepage.star,
    "list4": 329,
    "qty": 0
  },
  {
    "list1": Imagepage.nugets,
    "list2": "Tofu Nuggets \n Fingers",
    "list3": Imagepage.star,
    "list4": 290,
    "qty": 0
  },
];
int total = 0;

class _food_pageState extends State<food_page> {
  List<QueryDocumentSnapshot<Map<String, dynamic>>>? getCollection;



  getdata()  {
     FirebaseFirestore.instance
        .collection("Foods")
        .snapshots()
        .listen((event) {
      getCollection = event.docs;
      print(event.docs);
      total = 0;
      for (int i = 0; i < getCollection!.length; i++) {
        total = getCollection![i]["qty"] * getCollection![i]["list4"] + total;
        setState(() {});
      }
    });
  }

  adddata() {
    for (var data in F) {
      FirebaseFirestore.instance.collection("Foods").add(data);
    }
  }

  @override
  void initState() {

    getdata();
    // adddata();

    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        height: width * 0.16,
        width: width * 1,
        color: colorpage.darkblue,
        child: Column(
          children: [
            Divider(
              color: Colors.white,
              height: width * 0.01,
              thickness: width * 0.004,
              indent: width * 0.01,
              endIndent: width * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Price : ₹$total",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontSize: width * 0.06)),
              ],
            ),
          ],
        ),
      ),
      appBar: AppBar(
        elevation: 1,
        backgroundColor: colorpage.darkblue,
        title: Text(
          "Food Order",
          style: TextStyle(
              color: colorpage.white,
              fontSize: width * 0.06,
              fontWeight: FontWeight.w800),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Text(
              "itmes",
              style: TextStyle(
                  color: colorpage.black,
                  fontSize: width * 0.05,
                  fontWeight: FontWeight.w600),
            ),
            StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection("Foods").snapshots(),
              builder: (context, snapshot) {
                if(snapshot.data==null){
                  return const Center(child: CircularProgressIndicator());
                }
                var data = snapshot.data!.docs;
                return SizedBox(
                    height: width * 2.4,
                    width: width * 1,
                    child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(
                                left: width * 0.01, right: width * 0.02),
                            child: Container(
                              height: width * 0.35,
                              width: width * 1,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: width * 0.30,
                                    width: width * 0.30,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(width * 0.03),
                                        image: DecorationImage(
                                            image: AssetImage(
                                                data![index]["list1"]),
                                            fit: BoxFit.fill)),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        data![index]["list2"],
                                        style: TextStyle(
                                            fontSize: width * 0.05,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Image(
                                            image: AssetImage(
                                            data![index]["list3"]),
                                            height: width * 0.12,
                                          ),
                                          Row(
                                            children: [
                                              Text("₹ ",
                                                  style: TextStyle(
                                                      fontSize: width * 0.05,
                                                      fontWeight:
                                                          FontWeight.w600)),
                                              Text(
                                                data![index]["list4"]
                                                    .toString(),
                                                style: TextStyle(
                                                    fontSize: width * 0.05,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  data![index]["qty"] != 0
                                      ? Container(
                                          height: width * 0.15,
                                          width: width * 0.30,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                width * 0.03),
                                            color: Colors.black,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  setState(() {});
                                                  FirebaseFirestore.instance
                                                      .collection("Foods")
                                                      .doc(data![index].id)
                                                      .update({
                                                    "qty":
                                                        data![index]["qty"] - 1
                                                  });
                                                },
                                                child: CircleAvatar(
                                                  radius: width * 0.04,
                                                  backgroundColor: Colors.grey,
                                                  child: Icon(Icons.remove),
                                                ),
                                              ),
                                              Text(
                                                data![index]["qty"].toString(),
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  FirebaseFirestore.instance
                                                      .collection("Foods")
                                                      .doc(data![index].id)
                                                      .update({
                                                    "qty":
                                                        data![index]["qty"] + 1
                                                  });
                                                  setState(() {});
                                                },
                                                child: CircleAvatar(
                                                  radius: width * 0.04,
                                                  backgroundColor: Colors.grey,
                                                  child: Icon(Icons.add),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      : InkWell(
                                          onTap: () {
                                            FirebaseFirestore.instance
                                                .collection("Foods")
                                                .doc(data![index].id)
                                                .update({
                                              "qty":
                                              data![index]["qty"] + 1
                                            });
                                            setState(() {});
                                          },
                                          child: Container(
                                            height: width * 0.15,
                                            width: width * 0.2,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      width * 0.02),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                              child: Text(
                                                "Add Item",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                            ),
                                          ),
                                        ),

                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: width * 0.02,
                          );
                        },
                        itemCount: data!.length));
              },
            )
          ],
        ),
      ),
      backgroundColor: colorpage.white,
    ));
  }
}
