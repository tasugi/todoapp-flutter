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
          final index = todolist.tasks.indexOf(task);
          final icon = Icon(task.open
              ? Icons.radio_button_unchecked
              : Icons.radio_button_checked);
          return ListTile(
            title: Row(
              children: <Widget>[icon, Text(task.title)],
            ),
            onTap: () => {todolist.toggleOpen(index)},
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
  final List<Task> _tasks = [];

  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks);

  UnmodifiableListView<Task> get openTasks =>
      UnmodifiableListView(_tasks.where((task) => task.open));

  void add(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  /// 完了/未完了の状態をトグルする
  void toggleOpen(int index) {
    _tasks[index].toggleOpen();
    notifyListeners();
  }
}
