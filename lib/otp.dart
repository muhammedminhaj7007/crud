import 'package:crud/colorconstant.dart';
import 'package:crud/homepage.dart';
import 'package:crud/imageconstant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mdi_icons/flutter_mdi_icons.dart';
import 'package:pinput/pinput.dart';

import 'main.dart';

class otp extends StatefulWidget {
  const otp({super.key});

  @override
  State<otp> createState() => _otpState();
}

class _otpState extends State<otp> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
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
          "Verify OTP",
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image(image: AssetImage(Imagepage.img4)),
          SizedBox(
            height: width * 0.24,
            width: width * 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: "OTP has been sent to ",
                          style: TextStyle(color: colorpage.grey)),
                      TextSpan(
                          text: "  *****634",
                          style: TextStyle(
                              color: colorpage.darkblue,
                              fontSize: width * 0.04,
                              fontWeight: FontWeight.w600))
                    ])),
                    Icon(
                      Mdi.pencil,
                      size: width * 0.05,
                      color: colorpage.darkblue,
                    )
                  ],
                ),
                FractionallySizedBox(
                  child: Pinput(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    closeKeyboardWhenCompleted: true,
                    length: 5,
                    disabledPinTheme: PinTheme(
                        constraints: BoxConstraints(
                            maxHeight: width * 0.2, maxWidth: width * 0.1),
                        decoration: BoxDecoration(
                            color: colorpage.grey,
                            borderRadius: BorderRadius.circular(width * 0.04))),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: width * 0.25,
            width: width * 0.8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (context) => HomePage(),), (route) => false);
                   // Navigator.push(context, CupertinoPageRoute(builder: (context) => HomePage(),));
                  },
                  child: Container(
                    height: width * 0.15,
                    width: width * 0.70,
                    decoration: BoxDecoration(
                        border: Border.all(color: colorpage.darkblue),
                        borderRadius: BorderRadius.circular(width * 0.09)),
                    child: Center(
                      child: Text(
                        "Verify",
                        style: TextStyle(
                            color: colorpage.darkblue,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: "Haven't got the confirmation code yet?",
                      style: TextStyle(color: colorpage.black)),
                  TextSpan(
                      text: "Resend",
                      style: TextStyle(
                          color: colorpage.darkblue,
                          fontSize: width * 0.04,
                          fontWeight: FontWeight.w600))
                ]))
              ],
            ),
          ),
          SizedBox(
            height: height * 0.03,
          ),
          RichText(
              text: TextSpan(children: [
            TextSpan(
                text: "Try Another ", style: TextStyle(color: colorpage.black)),
            TextSpan(
                text: "Method?",
                style: TextStyle(
                    color: colorpage.darkblue,
                    fontSize: width * 0.04,
                    fontWeight: FontWeight.w600))
          ]))
        ],
      ),
    ));
  }
}
