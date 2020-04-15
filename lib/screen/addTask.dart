import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todolist/model/task.dart';
import 'package:todolist/model/task_data.dart';
import 'package:provider/provider.dart';

import '../constranst.dart';

class AddTask extends StatefulWidget {
//  final Function addTask;
//  AddTask(this.addTask);
  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  String title;
  final key = GlobalKey<FormState>();

  void check(value) {
    final form = key.currentState;
    if (form.validate()) {
      title = value;
      final task = Task(name: title);
      Provider.of<TaskData>(context).addTask(title);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: colorFour,
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: colorSecond,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        child: Form(
          key: key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Text(
                "Add Task",
                textAlign: TextAlign.center,
                style: kTextStyleblue,
              ),
              TextFormField(
                validator: (e) {
                  if (e.isEmpty) {
                    return "Can not null";
                  }
                },
                autofocus: true,
                textAlign: TextAlign.center,
                onSaved: (e) => title = e,
                onChanged: (value) {
                  title = value;
                },
              ),
              FlatButton(
                onPressed: () {
                  check(title);
                  Navigator.pop(context);
                },
                child: Text(
                  "Add",
                  style: kSmallTxt,
                ),
                color: colorPrimary,
              )
            ],
          ),
        ),
      ),
    );
  }
}
