import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Todo App',
        home: Todo(),
    );
  }
}

class TodoState extends State<Todo> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldState = GlobalKey<ScaffoldState>();
  final _tasks = <String>[];

  void _showBar(String message) {
    _scaffoldState.currentState.showSnackBar(SnackBar(content: Text(message)));
  }

  Widget _buildForm() {
    String _task = '';
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            onSaved: (value) {
              _task = value;
            },
          ),
          RaisedButton(
            onPressed: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                setState(() {
                  _tasks.add(_task);
                });
                _showBar('Created');
                _formKey.currentState.reset();
                _task = ''; // Clear form
              }
            },
            child: Text('Create'),
          )
        ],
      ),
    );
  }

  void _pushTasks() {
    Navigator.of(context).push(
        MaterialPageRoute<void>(
            builder: (BuildContext context) {
              final tiles = _tasks.map((String task) {
                return ListTile(
                  title: Text(
                    task,
                  ),
                );
              });
              final divided =
              ListTile.divideTiles(context: context, tiles: tiles).toList();
              return Scaffold(
                appBar: AppBar(
                  title: Text('Todo List'),
                ),
                body: ListView(children: divided),
              );
            }
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      appBar: AppBar(
        title: Text('Create New Task'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.list), onPressed: _pushTasks),
        ],
      ),
      body: _buildForm(),
    );
  }
}

class Todo extends StatefulWidget {
  @override
  TodoState createState() => TodoState();
}
