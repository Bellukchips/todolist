import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/model/task.dart';
import 'package:todolist/model/task_data.dart';
import 'package:todolist/screen/TaksTile.dart';

class TaksList extends StatefulWidget {
  final List<Task> taks;

  TaksList({this.taks});

  @override
  _TaksListState createState() => _TaksListState();
}

class _TaksListState extends State<TaksList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context,taskData,child){
        return  ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.taks[index];
            return TaskTile(
                title: task.name,
                selected: task.isDone,
                checkBoxCallback: (value) {
                  taskData.updateTask(task);
                },
            longpressCallback: (){
                  taskData.deleteTask(task);
            },);
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
