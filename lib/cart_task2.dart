import 'package:crud/colorconstant.dart';
import 'package:crud/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class cart_task2 extends StatefulWidget {

  final name;
  final price;
  final Quantity;
  final  sub;
  cart_task2({super.key, required this.sub, this.name, this.price, this.Quantity});

  @override
  State<cart_task2> createState() => _cart_task2State();
}

class _cart_task2State extends State<cart_task2> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: height * 0.04,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(
                  width: width * 0.02,
                ),
                InkWell(
                  onTap: () {
                    widget.name;
                    widget.Quantity;
                    widget.price;
                  },
                  child: Container(
                    height: width * 0.1,
                    width: width * 0.3,
                    child: Center(child: Text("All")),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(width * 0.03),
                      border: Border.all(color: Colors.black),
                      color: colorpage.white,
                    ),
                  ),
                ),
                SizedBox(
                  width: width * 0.03,
                ),
                Container(
                  height: width * 0.1,
                  width: width * 0.3,
                  child: Center(child: Text("Up to 100")),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(width * 0.03),
                    border: Border.all(color: Colors.black),
                    color: colorpage.white,
                  ),
                ),
                SizedBox(
                  width: width * 0.03,
                ),
                Container(
                  height: width * 0.1,
                  width: width * 0.3,
                  child: Center(child: Text("Up to 500")),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(width * 0.03),
                    border: Border.all(color: Colors.black),
                    color: colorpage.white,
                  ),
                ),
                SizedBox(
                  width: width * 0.03,
                ),
                Container(
                  height: width * 0.1,
                  width: width * 0.3,
                  child: Center(child: Text("Up to 1000")),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(width * 0.03),
                    border: Border.all(color: Colors.black),
                    color: colorpage.white,
                  ),
                ),
                SizedBox(
                  width: width * 0.02,
                ),
              ],
            ),
          ),
          // SizedBox(
          //   height: height*0.06,
          //   child: Expanded(
          //     child: ListView.separated(
          //       shrinkWrap: true,
          //       scrollDirection: Axis.horizontal,
          //         itemBuilder: (context, index) {
          //           return
          //             Padding(
          //               padding:  EdgeInsets.all(width*0.02),
          //               child: Row(
          //                 children: [
          //                   Container(
          //                     height: height*0.06,
          //                     width: width*0.25,
          //                     decoration: BoxDecoration( borderRadius: BorderRadius.circular(width*0.03),
          //                       border: Border.all(color: Colors.black),
          //                       color: colorpage.white
          //                     ),
          //                     child: Container(
          //                         child: Center(child: Text(Cart[index]["Text"]))),
          //                   )
          //                 ],
          //               ),
          //             );
          //         }, separatorBuilder: (context, index) {
          //           return const SizedBox( );
          //         }, itemCount: Cart.length),
          //   ),
          // ),
          SizedBox(
            height: height * 0.05,
          ),
        ],
      ),
    ));
  }
}
