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
      body: TaskForm(),
    );
  }
}

class TaskForm extends StatefulWidget {
  @override
  TaskFromState createState() {
    return TaskFromState();
  }
}

class TaskFromState extends State<TaskForm> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();


  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Title'),
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter title';
              }
              return null;
            },
            controller: _titleController,
          ),
          Align(
            alignment: Alignment.center,
            child: RaisedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  final Task task = Task(_titleController.text);
                  Provider.of<TodoListModel>(context, listen: false).add(task);
                  Navigator.pop(context);
                }
              },
              child: Text('Add'),
            ),
          ),
        ],
      ),
    );
  }
}
