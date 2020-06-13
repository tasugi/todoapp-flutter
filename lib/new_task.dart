import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'main.dart';
import 'task.dart';

class NewTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create New Task'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Title'),
          TextFormField(),
          Text('Description'),
          TextFormField(),
          Align(
            alignment: Alignment.center,
            child: RaisedButton(
              onPressed: () {
                final Task task = Task('New task', '');
                Provider.of<TodoListModel>(context, listen: false).add(task);
              },
              child: Text('Add'),
            ),
          ),
        ],
      ),
    );
  }
}
