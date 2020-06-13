import 'package:flutter/material.dart';
import 'package:todoapp/newTask.dart';

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

class TaskList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final tasks = [
      'Task 1',
      'Task 2',
    ];
    final tiles = tasks.map((String task) {
      return ListTile(
        title: Text(
          task,
        ),
      );
    });
    final divided =
    ListTile.divideTiles(context: context, tiles: tiles).toList();
    return ListView(children: divided);
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
          Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (BuildContext context) {
                    return NewTask();
                  }
              )
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
