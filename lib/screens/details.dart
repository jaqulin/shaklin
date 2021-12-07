import 'package:flutter/material.dart';
import 'package:midterm/models/assessment.dart';
import 'package:midterm/models/form.dart';

class DetailsScreen extends StatelessWidget {
  final Assessment _data;

  // ignore: use_key_in_widget_constructors
  const DetailsScreen(this._data);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        appBar: AppBar(
          leading: Container(),
          title: Text(_data.member.fullName),
          centerTitle: true,
        ),
        body: ListView.separated(
          itemCount: criteria.length,
          itemBuilder: (context, index) => ListTile(
            title: Text(criteria[index].title),
            subtitle: Text(criteria[index].description),
            trailing: _DropdownButton(index: index, points: _data.points),
          ),
          separatorBuilder: (context, index) => const Divider(
            color: Colors.green,
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton.extended(
              label: const Text('Save'),
              icon: const Icon(Icons.save),
              heroTag: null,
              onPressed: () => Navigator.pop(context, _data),
            ),
            FloatingActionButton.extended(
              label: const Text('Cancel'),
              icon: const Icon(Icons.cancel),
              heroTag: null,
              onPressed: () => Navigator.pop(context, null),
            ),
          ],
        ),
      ),
    );
  }
}

class _DropdownButton extends StatefulWidget {
  final int index;
  final List<int> points;

  const _DropdownButton({required this.index, required this.points});

  @override
  __DropdownButtonState createState() => __DropdownButtonState();
}

class __DropdownButtonState extends State<_DropdownButton> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<int>(
      value: widget.points[widget.index],
      items: scales
          .map(
            (scale) => DropdownMenuItem(
              value: scale.value,
              child: Text(scale.title),
            ),
          )
          .toList(),
      onChanged: (newValue) =>
          setState(() => widget.points[widget.index] = newValue!),
    );
  }
}
