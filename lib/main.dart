import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/constranst.dart';
import 'package:todolist/model/task_data.dart';
import 'package:todolist/screen/TaksList.dart';
import 'package:todolist/screen/addTask.dart';

import 'model/task.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context)=> TaskData(),
      child: MaterialApp(
        home: HomePage(),
        debugShowCheckedModeBanner: false,
        title: "TO DO List",
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Task> taks = [];

  Widget bodyList() {
    return Material(
      elevation: 10,
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(60), topLeft: Radius.circular(60)),
      child: Container(
          height: 300,
          width: double.infinity,
          decoration: BoxDecoration(
              color: colorSecond,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(60), topLeft: Radius.circular(60))),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: TaksList(
              taks: taks,
            ),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorPrimary,
      floatingActionButton: FloatingActionButton(
          backgroundColor: colorPrimary,
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (context) => AddTask());
          },
          child: Icon(
            Icons.add,
            color: colorSecond,
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 30, right: 30, top: 60, bottom: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: CircleAvatar(
                        maxRadius: 40,
                        backgroundColor: colorSecond,
                        child: Icon(
                          Icons.list,
                          size: 30,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "To Do List",
                        style: kTextStyle,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    "${Provider.of<TaskData>(context).taskCount} Taks",
                    style: kSmallTxt,
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: bodyList())
        ],
      )),
    );
  }
}
