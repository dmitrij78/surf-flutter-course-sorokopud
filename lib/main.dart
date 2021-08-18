import 'package:flutter/material.dart';

import 'package:places/ui/res/strings/strings.dart';
import 'package:places/ui/res/themes.dart';
import 'package:places/ui/screen/home_screen.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final AppModel appModel = AppModel(darkMode: false);

  @override
  void initState() {
    appModel.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      theme: appModel.isDarkMode ? darkTheme : lightTheme,
      home: HomeScreen(appModel: appModel),
    );
  }

  @override
  void dispose() {
    appModel.dispose();
    super.dispose();
  }
}

class AppModel extends ChangeNotifier {
  bool _isDarkMode;

  AppModel({required bool darkMode}) : _isDarkMode = darkMode;

  bool get isDarkMode => _isDarkMode;

  void setDarkMode(bool value) {
    _isDarkMode = value;
    notifyListeners();
  }
}
