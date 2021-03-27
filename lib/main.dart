import 'package:flutter/material.dart';
import 'package:places/ui/screen/sight_list_screen.dart';

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
      home: SightListScreen(),
    );
  }
}
