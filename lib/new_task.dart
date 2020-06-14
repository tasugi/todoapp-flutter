import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'task.dart';
import 'todo_list_model.dart';

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
  final _descController = TextEditingController();

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
            decoration: InputDecoration(border: OutlineInputBorder()),
            maxLines: 1,
          ),
          Text('Description'),
          TextFormField(
            controller: _descController,
            maxLines: 5,
            decoration: InputDecoration(border: OutlineInputBorder()),
          ),
          Align(
            alignment: Alignment.center,
            child: RaisedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  final Task task =
                      Task(_titleController.text, _descController.text);
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
