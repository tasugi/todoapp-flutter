class Task {
  Task(this.title);

  final String title;
  bool open = true;

  void toggleOpen() {
    open = !open;
  }
}
