import 'package:flutter/material.dart';
import '../../models/todo.dart';

class Bar extends StatelessWidget implements PreferredSizeWidget {
  final Todo todos;
  // ignore: use_key_in_widget_constructors
  const Bar(this.todos);

  @override
  Size get preferredSize => const Size.fromHeight(50.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shadowColor: Colors.transparent,
      leading: Container(),
      backgroundColor: Colors.white,
      title: Text(
        'My To Do List ' + todos.title,
        style: const TextStyle(color: Colors.blue),
      ),
      centerTitle: true,
    );
  }

  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
