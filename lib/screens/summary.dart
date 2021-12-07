import 'package:flutter/material.dart';
import 'package:midterm/models/assessment.dart';
import 'package:midterm/models/group_member.dart';
// ignore: unused_import
import 'package:midterm/models/mock_data.dart';
import '../constants.dart';

class SummaryScreen extends StatelessWidget {
  final GroupMember _evaluator;
  // ignore: prefer_typing_uninitialized_variables
  final _data;

  // ignore: use_key_in_widget_constructors
  const SummaryScreen(this._evaluator, this._data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.white,
        title: Column(
          children: <Widget>[
            const Text(
              'Peer and Self Assessement by',
              style: TextStyle(fontSize: 15, color: Colors.blue),
            ),
            Text(
              _evaluator.fullName,
              style: const TextStyle(fontSize: 25, color: Colors.blue),
            ),
          ],
        ),
      ),
      body: ListView.separated(
        itemCount: _data.length,
        itemBuilder: (context, index) => _ListTile(
          index: index,
          assessements: _data,
        ),
        separatorBuilder: (context, index) => const Divider(
          color: Colors.grey,
        ),
      ),
    );
  }
}

class _ListTile extends StatefulWidget {
  final int index;
  final List<Assessment> assessements;
  const _ListTile({required this.index, required this.assessements});

  @override
  __ListTileState createState() => __ListTileState();
}

class __ListTileState extends State<_ListTile> {
  void _navigate() async {
    dynamic result = await Navigator.pushNamed(context, detailsRoute,
        arguments: Assessment.copy(widget.assessements[widget.index]));

    if (result != null) {
      setState(() => widget.assessements[widget.index] = result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.assessements[widget.index].member.shortName),
      subtitle: Text(widget.assessements[widget.index].member.fullName),
      trailing: CircleAvatar(
        child: Text(
          widget.assessements[widget.index].percent.round().toString(),
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: widget.assessements[widget.index].percent < 50
            ? Colors.red
            : Colors.green,
      ),
      onTap: () => _navigate(),
    );
  }
}
