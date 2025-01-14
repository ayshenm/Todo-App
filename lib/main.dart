import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo_app/constants/color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
          child: Scaffold(
            backgroundColor: HexColor(backgroundColor),
            body: Container(
              width: deviceWidth,
              height: deviceHeight / 3,
              decoration:BoxDecoration(
                color: Colors.purple,
                image: DecorationImage(image: AssetImage("lib/assets/images/header.png"), fit: BoxFit.cover)
              ) ,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      "January 14, 2025",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: Text("My First Flutter Project - Todo App",style: TextStyle(color:Colors.white, fontSize: 30, fontWeight: FontWeight.bold),)),
                ],
              ),
            ),
          ),
        ));
  }
}
