import 'package:flutter/material.dart';

import '../constranst.dart';

class TaskTile extends StatelessWidget {
  final bool selected;
  final String title;
  final Function checkBoxCallback;
  final Function longpressCallback;

  TaskTile({this.selected, this.title, @required this.checkBoxCallback,this.longpressCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longpressCallback,
        title: Text(
          title,
          style: TextStyle(
              decoration: selected ? TextDecoration.lineThrough : null),
        ),
        trailing: Checkbox(value: selected, onChanged:checkBoxCallback));
  }
}
