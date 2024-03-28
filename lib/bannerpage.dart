import 'package:crud/colorconstant.dart';
import 'package:crud/imageconstant.dart';
import 'package:crud/main.dart';
import 'package:crud/otp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BannerPage extends StatefulWidget {
  const BannerPage({super.key});

  @override
  State<BannerPage> createState() => _BannerPageState();
}

class _BannerPageState extends State<BannerPage> {
  TextEditingController title = TextEditingController();
  List banner=[
  {
  "image":Imagepage.img12,
  "text1":"Banner 1",
  "text2":"2 May",
  "icon":Imagepage.delete
},
{
"image":Imagepage.img13,
"text1":"Banner 2",
"text2":"2 May",
"icon":Imagepage.delete
},
{
"image":Imagepage.img14,
"text1":"Banner 3",
"text2":"2 May",
"icon":Imagepage.delete
},
];
  @override
  Widget build(BuildContext context) {
    return SafeArea(child:Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: colorpage.white,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
          title: Text("Edit User",style: TextStyle(
              fontWeight: FontWeight.w800,
              color: colorpage.black
          ),),
        ),
        body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Padding(
                  padding:  EdgeInsets.all( width*0.05),
                  child: Container(
                      height: width*0.65,
                      width: width*0.9,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(width*0.04),
                        color: Colors.lightBlue[100],
                      ),

                      child: Column(
                        children: [
                          Center(child: Image.asset(Imagepage.picture,width: width*0.4,)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Click here to Upload",style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: width*0.05
                              ),),
                              Text("Image",style: TextStyle(fontWeight: FontWeight.w800,color: Colors.blueAccent,fontSize: width*0.05),)
                            ],
                          ),
                          SizedBox(height:width*0.02 ,),
                          Text("Supports: PNG, JPG, JPEG, WEBP",style: TextStyle(color: Colors.grey,fontSize: width*0.03),)
                        ],
                      )),
                ),
                Column(
                  children: [
                    Padding(
                      padding:  EdgeInsets.all(width*0.05),
                      child: Container(
                        width: width * 0.9,
                        height: width * 0.18,
                        decoration: BoxDecoration(
                          // border: Border.all(color: Colorconst.primarycolor),
                          // borderRadius:
                          color: colorpage.white,
                        ),
                        child: TextFormField(
                            controller: title,
                            cursorColor: Colors.black,
                            autovalidateMode:
                            AutovalidateMode.onUserInteraction,
                            textInputAction: TextInputAction.newline,
                            decoration: InputDecoration(

                              label: Text("Title",
                                style: TextStyle(
                                    color: colorpage.black,
                                    fontSize: width * 0.06),),
                              focusedBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(width * 0.04),),
                              enabledBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(width * 0.04),),
                            )),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding:  EdgeInsets.all(width*0.05),
                  child: Container(
                    height: width*0.13,
                    width: width*0.7,
                    decoration: BoxDecoration(
                        color: colorpage.white,
                        borderRadius: BorderRadius.circular(width*0.06),
                        border: Border.all(color: colorpage.darkblue,width: width*0.005)

                    ),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Upload Banner",style: TextStyle(
                            color: colorpage.darkblue,
                            fontWeight: FontWeight.w900
                        ),),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: width*1,
                  width: width*1,
                  child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding:  EdgeInsets.all(width*0.03,),
                          child: Container(
                              height: width * 0.23,
                              width: width * 0.33,
                              decoration: BoxDecoration(
                                  boxShadow:[ BoxShadow(
                                    blurStyle: BlurStyle.normal,
                                    color: Colors.black.withOpacity(0.15),
                                    offset: Offset(0, 4),
                                    spreadRadius: 15,
                                    blurRadius: 15,
                                  )],
                                  borderRadius: BorderRadius.circular(width*0.04),
                                  color: colorpage.grey
                              ),
                              child: ListTile(
                                  leading: Image.asset(banner[index]["image"]),
                                  title: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        banner[index]["text1"],
                                        style: TextStyle(
                                            fontSize: width * 0.04,
                                            fontWeight: FontWeight.w600,color: Colors.blueAccent),
                                      ),
                                    ],
                                  ),
                                  subtitle: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SizedBox(
                                        height: height*0.03,
                                      ),
                                      Text(
                                        banner[index]["text2"],
                                        style: TextStyle(fontSize: width * 0.03,color: colorpage.black),
                                      ),
                                    ],
                                  ),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      InkWell(
                                          onTap: () {
                                            showCupertinoModalPopup(context: context, builder: (context) {
                                              return CupertinoAlertDialog(
                                                title: Text("Are you sure\nYou want to delete User"),
                                                actions: [
                                                  Column(
                                                    children: [
                                                      CupertinoDialogAction(child: Text("yes",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w800,color: Colors.red),)),
                                                      Divider(),
                                                      CupertinoDialogAction(child: Text("cancel",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w800),)
                                                        ,onPressed: () {
                                                          Navigator.pop(context);
                                                        },),

                                                    ],
                                                  )
                                                ],
                                              );
                                            },);
                                          },
                                          child: SvgPicture.asset(banner[index]["icon"],color: Colors.red,)),

                                    ],
                                  ))),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: width * 0.0001,

                        );
                      },
                      itemCount: banner.length),
                ),
              ],
            ),
            ),
        )
    );
  }
}
