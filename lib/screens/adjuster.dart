import 'package:flutter/material.dart';

class AdjustPage extends StatefulWidget {
  const AdjustPage({Key? key}) : super(key: key);

  @override
  State<AdjustPage> createState() => _AdjustPageState();
}

class _AdjustPageState extends State<AdjustPage> {
  bool _resizeIcon = true;
  // ignore: non_constant_identifier_names
  bool _ColorIcon = true;
  var _sameValue = 40.0;
  int _redVal = 0;
  int _blueVal = 0;
  int _greenVal = 0;

  // var max;
  // var min;
  // var val;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("My Icon"),
        actions: !_resizeIcon
            ? null
            : <Widget>[
                // ignore: avoid_unnecessary_containers
                Container(
                  child: IconButton(
                      icon: const Text("-"),
                      onPressed: () => setState(() {
                            _sameValue -= 50;
                          })),
                ),
                // ignore: avoid_unnecessary_containers
                Container(
                  child: IconButton(
                      icon: const Text("S"),
                      onPressed: () => setState(() {
                            _sameValue = 100;
                          })),
                ),
                // ignore: avoid_unnecessary_containers
                Container(
                  child: IconButton(
                      icon: const Text("M"),
                      onPressed: () => setState(() {
                            _sameValue = 300;
                          })),
                ),
                // ignore: avoid_unnecessary_containers
                Container(
                  child: IconButton(
                      icon: const Text("L"),
                      onPressed: () => setState(() {
                            _sameValue = 500;
                          })),
                ),
                // ignore: avoid_unnecessary_containers
                Container(
                  child: IconButton(
                      icon: const Text("+"),
                      onPressed: () => setState(() {
                            _sameValue += 50;
                          })),
                ),
              ],
      ),
      drawer: Drawer(
          child: ListView(
        children: <Widget>[
          Card(
              child: CheckboxListTile(
            value: _resizeIcon,
            title: const Text("Allow Resize?"),
            onChanged: (value) {
              setState(() {
                _resizeIcon = value!;
              });
            },
          )),
          Card(
              child: CheckboxListTile(
            value: _ColorIcon,
            title: const Text("Allow Change Primer Color?"),
            onChanged: (value) {
              setState(() {
                _ColorIcon = value!;
              });
            },
          ))
        ],
      )),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // ignore: avoid_unnecessary_containers
            Container(
                child: Icon(
              Icons.access_alarm,
              color: Color.fromARGB(255, _redVal, _greenVal, _blueVal),
              size: _sameValue,
            ))
          ],
        ),
      ),
      bottomNavigationBar: !_ColorIcon
          ? null
          : SizedBox(
              width: 100,
              height: 220,
              child: Column(
                children: <Widget>[
                  // ignore: avoid_unnecessary_containers
                  Container(
                      child: Row(children: <Widget>[
                    Expanded(
                        child: Slider(
                            max: 255,
                            min: 0,
                            value: _redVal.toDouble(),
                            onChanged: (value) {
                              setState(() => _redVal = value.toInt());
                            })),
                    FloatingActionButton(
                      onPressed: () => setState(() {
                        _blueVal = 0;
                        _redVal = 255;
                        _greenVal = 0;
                      }),
                      child: Text(_redVal.toStringAsFixed(0)),
                      backgroundColor: Colors.red,
                    )
                  ])),
                  // ignore: avoid_unnecessary_containers
                  Container(
                      child: Row(children: <Widget>[
                    Expanded(
                        child: Slider(
                            max: 255,
                            min: 0,
                            value: _greenVal.toDouble(),
                            onChanged: (value) {
                              setState(() => _greenVal = value.toInt());
                            })),
                    FloatingActionButton(
                      onPressed: () => setState(() {
                        _blueVal = 0;
                        _redVal = 0;
                        _greenVal = 255;
                      }),
                      child: Text(_greenVal.toStringAsFixed(0)),
                      backgroundColor: Colors.green,
                    )
                  ])),
                  // ignore: avoid_unnecessary_containers
                  Container(
                      child: Row(children: <Widget>[
                    Expanded(
                        child: Slider(
                            max: 255,
                            min: 0,
                            value: _blueVal.toDouble(),
                            onChanged: (value) {
                              setState(() => _blueVal = value.toInt());
                            })),
                    FloatingActionButton(
                      onPressed: () => setState(() {
                        _blueVal = 255;
                        _redVal = 0;
                        _greenVal = 0;
                      }),
                      child: Text(_blueVal.toStringAsFixed(0)),
                      backgroundColor: Colors.blue,
                    )
                  ]))
                ],
              )),
    ));
  }
}
