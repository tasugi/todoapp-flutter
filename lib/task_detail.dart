import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/task.dart';

class TaskDetail extends StatelessWidget {
  final Task task;

  TaskDetail({Key key, @required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Task Detail'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Title'),
            Container(
              decoration: BoxDecoration(border: Border.all()),
              child: Text(task.title),
            ),
            Text('Description'),
            Container(
              decoration: BoxDecoration(border: Border.all()),
              child: Text(task.description),
            ),
          ],
        ));
  }
}
