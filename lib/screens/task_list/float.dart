import 'package:flutter/material.dart';
import '../../models/todo.dart';

// ignore: must_be_immutable
class Float extends StatelessWidget {
  Todo todos;
  // ignore: use_key_in_widget_constructors
  Float(this.todos);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        FloatingActionButton.extended(
          heroTag: null,
          onPressed: () => Navigator.pop(context, todos),
          label: const Text('update'),
          icon: const Icon(Icons.check_circle),
        ),
        FloatingActionButton.extended(
          heroTag: null,
          onPressed: () => Navigator.pop(context, null),
          label: const Text('Cancel'),
          icon: const Icon(Icons.cancel),
        )
      ],
    );
  }
}
