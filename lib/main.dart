import 'package:crud/adduser.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'cart_task1.dart';
import 'cart_task2.dart';
import 'food_page.dart';
import 'loginscreen1.dart';
import 'splashscreen.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Crud());
}


///note added by anshif


var width;
var height;

class Crud extends StatelessWidget {
  const Crud({super.key});
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
        ),
        home : cart_task1(),
        // food_page(),
        // home:LoginScreen1(),
         debugShowCheckedModeBanner: false,
      ),
    );
  }
}


