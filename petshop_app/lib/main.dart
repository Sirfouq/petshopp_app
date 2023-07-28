// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:lottie/lottie.dart';
import 'package:petshop_app/config/app_router.dart';
import 'package:petshop_app/services/dbservices.dart';

void main() async {
  await Hive.initFlutter();
  // var box =  HiveService('box');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routerConfig: router);
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(223, 184, 235, 245),
      body: SafeArea(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
            padding: EdgeInsets.all(30.0),
            child: SizedBox(
              width: 500,
              height: 300,
              child: Lottie.asset('lib/assets/dog.json',
                  frameRate: FrameRate(120)),
            ),
          ),
          SizedBox(
            child: Padding(
              padding: EdgeInsets.all(70.0),
              child: Text(
                'Provide the best treats to your best friend !!',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Color.fromARGB(255, 255, 255, 255)),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              return context.go('/dashboard');
            },
            child: Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 0, 0, 0),
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                  child: Text(
                'Shop Now',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontFamily: GoogleFonts.openSans().fontFamily),
              )),
            ),
          )
        ]),
      ),
    );
  }
}
