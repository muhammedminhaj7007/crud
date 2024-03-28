import 'package:carousel_slider/carousel_slider.dart';
import 'package:crud/colorconstant.dart';
import 'package:crud/homepage1.dart';
import 'package:crud/imageconstant.dart';
import 'package:crud/loginscreen1.dart';
import 'package:crud/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mdi_icons/flutter_mdi_icons.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'apipage.dart';
import 'bannerpage.dart';
import 'profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentindex = 0;

  List images = [
    "assets/png/img6.png",
    "assets/png/img6.png",
    "assets/png/img6.png"
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: colorpage.white,
          title: const Text(
            "Hello, User",
            style: TextStyle(color: colorpage.black),
          ),
          actions: [
            Row(
              children: [
                InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Profile(),
                          ));
                    },
                    child: Image.asset(Imagepage.img5, width: width * 0.12)),
                SizedBox(width: width * 0.03),
                InkWell(
                    onTap: () async {
                      final SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      await prefs.remove('login');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen1(),
                          ));
                      setState(() {});
                    },
                    child: Icon(
                      Mdi.logout,
                      color: colorpage.black,
                      size: width * 0.10,
                    ))
              ],
            )
          ],
        ),
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CarouselSlider.builder(
                itemCount: images.length,
                itemBuilder: (context, index, realIndex) {
                  return Column(
                    children: [
                      Container(
                        height: width * 0.5,
                        width: width * 1,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(Imagepage.img6))),
                      )
                    ],
                  );
                },
                options: CarouselOptions(
                  viewportFraction: 1,
                  autoPlay: true,
                  enableInfiniteScroll: true,
                  onPageChanged: (index, reason) {
                    currentindex = index;
                    setState(() {});
                  },
                )),
            AnimatedSmoothIndicator(
              activeIndex: currentindex,
              count: images.length,
              effect: JumpingDotEffect(
                  radius: 20, dotWidth: 10, activeDotColor: colorpage.black),
            ),
            SizedBox(
              height: height * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HoMePage1(),
                        ));
                  },
                  child: Container(
                      height: width * 0.4,
                      width: width * 0.4,
                      decoration: BoxDecoration(
                          color: colorpage.white,
                          borderRadius: BorderRadius.circular(width * 0.08),
                          boxShadow: [
                            BoxShadow(
                                blurStyle: BlurStyle.normal,
                                color: colorpage.black.withOpacity(0.12),
                                offset: Offset(0, 4),
                                spreadRadius: 12,
                                blurRadius: 12)
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                              width: width * 0.2,
                              height: height * 0.10,
                              child: const Image(
                                image: AssetImage(Imagepage.img7),
                                width: 1,
                              )),
                          Text('CRUD')
                        ],
                      )),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => BannerPage(),
                        ));
                  },
                  child: Container(
                      height: width * 0.4,
                      width: width * 0.4,
                      decoration: BoxDecoration(
                          color: colorpage.white,
                          borderRadius: BorderRadius.circular(width * 0.08),
                          boxShadow: [
                            BoxShadow(
                                blurStyle: BlurStyle.normal,
                                color: colorpage.black.withOpacity(0.12),
                                offset: Offset(0, 4),
                                spreadRadius: 12,
                                blurRadius: 12)
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                              width: width * 0.6,
                              height: height * 0.18,
                              child: const Image(
                                image: AssetImage(Imagepage.img8),
                                width: 1,
                              )),
                        ],
                      )),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.04,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: width * 0.08,
              ),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => const ApiPage(),
                          ));
                    },
                    child: Container(
                        height: width * 0.4,
                        width: width * 0.4,
                        decoration: BoxDecoration(
                            color: colorpage.white,
                            borderRadius: BorderRadius.circular(width * 0.08),
                            boxShadow: [
                              BoxShadow(
                                  blurStyle: BlurStyle.normal,
                                  color: colorpage.black.withOpacity(0.12),
                                  offset: Offset(0, 4),
                                  spreadRadius: 12,
                                  blurRadius: 12)
                            ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                                width: width * 0.5,
                                height: height * 0.13,
                                child: const Image(
                                  image: AssetImage(Imagepage.img9),
                                  width: 1,
                                )),
                            const Text('API ')
                          ],
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
        backgroundColor: colorpage.white,
      ),
    );
  }
}
