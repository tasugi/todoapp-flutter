import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/new_task.dart';

import 'task.dart';
import 'task_detail.dart';
import 'todo_list_model.dart';

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
              children: <Widget>[
                GestureDetector(
                  child: icon,
                  onTap: () => {
                    todolist.toggleOpen(index)
                  },
                ),
                Text(task.title)],
            ),
            onTap: () => {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (BuildContext context) {
                    return TaskDetail();
                  }))
            },
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

