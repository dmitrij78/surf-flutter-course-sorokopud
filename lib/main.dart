import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Places app',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Roboto'),
      home: MyFirstStatelessWidget(),
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

  //void getType() => context.runtimeType;
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

  void getType() => context.runtimeType;
}
