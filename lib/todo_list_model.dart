import 'dart:collection';

import 'package:flutter/cupertino.dart';

import 'task.dart';

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

  Task getTask(int index) {
    return _tasks[index];
  }
}
