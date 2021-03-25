import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Roboto'),
      home: MyFirstStatefulWidget(),
    );
  }
}

class MyFirstStatelessWidget extends StatelessWidget {
  var _counter = 0;

  @override
  Widget build(BuildContext context) {
    _counter += 1;
    print(_counter);
    return Container(
      child: Center(
        child: Text('Hello course'),
      ),
    );
  }
}

class MyFirstStatefulWidget extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MyFirstStatefulWidget> {
  var _counter = 0;
  @override
  Widget build(BuildContext context) {
    _counter += 1;
    print(_counter);
    return Container(
      child: Center(
        child: Text('Hello course'),
      ),
    );
  }
}
