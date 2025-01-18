import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo_app/constants/color.dart';
import 'package:todo_app/screens/add_new_task.dart';
import 'package:todo_app/todo_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> todoList = ["Study Lessons", "Run 5K", "Go to party"];
  List<String> complated = [
    "Game meetup",
    "Take out trash",
  ];
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
          child: Scaffold(
            backgroundColor: HexColor(backgroundColor),
            body: Column(children: [
              Container(
                width: deviceWidth,
                height: deviceHeight / 3,
                decoration: BoxDecoration(
                    color: Colors.purple,
                    image: DecorationImage(
                        image: AssetImage("lib/assets/images/header.png"),
                        fit: BoxFit.cover)),
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
                        child: Text(
                          "My First Flutter Project - Todo App",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        )),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: SingleChildScrollView(
                        child: ListView.builder(
                      primary: false,
                      shrinkWrap: true,
                      itemCount: todoList.length,
                      itemBuilder: (context, index) {
                        return TodoItem(
                          title: todoList[index],
                        );
                      },
                    ))),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Complated",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    )),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: SingleChildScrollView(
                      child: ListView.builder(
                    primary: false,
                    shrinkWrap: true,
                    itemCount: complated.length,
                    itemBuilder: (context, index) {
                      return TodoItem(title: complated[index]);
                    },
                  )),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AddNewTaskScreen(),
                    ));
                  },
                  child: Text("Add New Task"))
            ]),
          ),
        ));
  }
}
