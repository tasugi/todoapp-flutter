class Task {
  Task(this.title, this.description);

  final String title;
  final String description;
  bool open = true;

  void toggleOpen() {
    open = !open;
  }
}
