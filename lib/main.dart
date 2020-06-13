import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/new_task.dart';

import 'task.dart';

void main() => runApp(ChangeNotifierProvider(
      create: (context) => TodoListModel(),
      child: MyApp(),
    ));

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

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TodoListModel>(
      builder: (context, todolist, child) {
        final tiles = todolist.tasks.map((Task task) {
          return ListTile(
            title: Text(
              task.title,
            ),
          );
        });
        final divided =
            ListTile.divideTiles(context: context, tiles: tiles).toList();
        return ListView(children: divided);
      },
    );
  }
}

class Todo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: TaskList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (BuildContext context) {
            return NewTask();
          }));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class TodoListModel extends ChangeNotifier {
  final List<Task> _tasks = [
    Task('Task 1', ''),
  ];

  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks);

  void add(Task task) {
    _tasks.add(task);
    notifyListeners();
  }
}
