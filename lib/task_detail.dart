import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'todo_list_model.dart';

class TaskDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task Detail'),
      ),
      body: TaskDetailBody(),
    );
  }
}

class TaskDetailBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TodoListModel>(
      builder: (context, todolist, child) {
        final task = todolist.getTask(0);
        return Column(
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
        );
      },
    );
  }
}
