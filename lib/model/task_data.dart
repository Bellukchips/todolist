import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:todolist/model/task.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier {
  List<Task> taks = [];

  UnmodifiableListView<Task> get _task{
    return UnmodifiableListView(taks);
  }
  int get taskCount {
    return taks.length;
  }
  void addTask(String newTask){
    final task = Task(name: newTask);
    taks.add(task);
    notifyListeners();
  }

  void updateTask(Task task){
    task.toggleDone();
    notifyListeners();
  }
  void deleteTask(Task task){
    taks.remove(task);
    notifyListeners();
  }
}
