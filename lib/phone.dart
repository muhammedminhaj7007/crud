import 'package:country_code_picker/country_code_picker.dart';
import 'package:crud/colorconstant.dart';
import 'package:crud/imageconstant.dart';
import 'package:crud/otp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class Phone extends StatefulWidget {
  const Phone({super.key});

  @override
  State<Phone> createState() => _PhoneState();
}

class _PhoneState extends State<Phone> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
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
          "       Enter Phone Number",
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
          const Image(image: AssetImage(Imagepage.img3)),
          Column(
            children: [
              TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    constraints: BoxConstraints(maxWidth: width * 0.9),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(width * 0.03),
                      borderSide: BorderSide(color: colorpage.darkblue),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: colorpage.darkblue),
                        borderRadius: BorderRadius.circular(width * 0.03)),
                    prefixIcon: CountryCodePicker(
                      onChanged: print,
                      // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                      initialSelection: 'IT',
                      favorite: ['+39', 'FR'],
                      // optional. Shows only country name and flag
                      showCountryOnly: false,
                      // optional. Shows only country name and flag when popup is closed.
                      showOnlyCountryWhenClosed: false,
                      // optional. aligns the flag and the Text left
                      alignLeft: false,
                    ),
                  )),
              SizedBox(
                height: height * 0.04,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => otp(),
                      ));
                  setState(() {});
                },
                child: Container(
                  height: width * 0.15,
                  width: width * 0.70,
                  decoration: BoxDecoration(
                      border: Border.all(color: colorpage.darkblue),
                      borderRadius: BorderRadius.circular(width * 0.09)),
                  child: const Center(
                    child: Text(
                      "Send OTP",
                      style: TextStyle(
                          color: colorpage.darkblue,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: width * 0.04,
          ),
          RichText(
              text: TextSpan(children: [
            TextSpan(
                text: "Sign in with",
                style: TextStyle(color: colorpage.darkblue)),
            TextSpan(
                text: " Another Method ?",
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
