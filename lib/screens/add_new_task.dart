import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo_app/constants/color.dart';
import 'package:todo_app/constants/task_type.dart';
import 'package:todo_app/model/task.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key, required this.addNewTask});
  final void Function(Task newTask) addNewTask;

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  TaskType taskType = TaskType.note;

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      backgroundColor: HexColor(backgroundColor),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            width: deviceWidth,
            height: deviceHeight / 10,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image:
                      AssetImage("lib/assets/images/add_new_task_header.png"),
                  fit: BoxFit.cover),
            ),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.close,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
                Expanded(
                    child: Text(
                  "Add New Task",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                )),
              ],
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 10), child: Text("Task title")),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: TextField(
                controller: titleController,
                decoration:
                    InputDecoration(filled: true, fillColor: Colors.white),
              )),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Category"),
                GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      duration: Duration(milliseconds: 300),
                      content: Text("Category selected"),
                    ));
                    setState(() {
                      taskType = TaskType.note;
                    });
                  },
                  child: Image.asset("lib/assets/images/category_1.png"),
                ),
                GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      duration: Duration(milliseconds: 300),
                      content: Text("Category selected"),
                    ));
                    setState(() {
                      taskType = TaskType.calendar;
                    });
                  },
                  child: Image.asset("lib/assets/images/category_2.png"),
                ),
                GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      duration: Duration(milliseconds: 300),
                      content: Text("Category selected"),
                    ));
                    setState(() {
                      taskType = TaskType.contest;
                    });
                  },
                  child: Image.asset("lib/assets/images/category_3.png"),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text("Date"),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: TextField(
                            controller: dateController,
                            decoration: InputDecoration(
                                filled: true, fillColor: Colors.white),
                          )),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text("Time"),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: TextField(
                            controller: timeController,
                            decoration: InputDecoration(
                                filled: true, fillColor: Colors.white),
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text("Description"),
          ),
          SizedBox(
            height: 300,
            child: TextField(
              controller: descriptionController,
              maxLines: null,
              expands: true,
              decoration: InputDecoration(
                  filled: true, fillColor: Colors.white, isDense: true),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                Task newtask = Task(
                    type: taskType,
                    title: titleController.text,
                    description: descriptionController.text,
                    isComplate: false,
                    );
                    widget.addNewTask(newtask);
                    Navigator.pop(context);
              },
              child: Text("Save"))
        ]),
      ),
    ));
  }
}
