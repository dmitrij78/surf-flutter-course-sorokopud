import 'package:flutter/material.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/res/strings/strings.dart';
import 'package:places/ui/res/styles.dart';
import 'package:places/ui/screen/sight_details.dart';
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
      title: appTitle,
      theme: themeData,
      home: SightListScreen(sights: mocks),
    );
  }
}
