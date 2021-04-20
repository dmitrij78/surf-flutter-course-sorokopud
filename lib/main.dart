import 'package:flutter/material.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/res/strings/strings.dart';
import 'package:places/ui/res/text_styles.dart';
import 'package:places/ui/screen/home_screen.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final bool _isDarkMode = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      theme: _isDarkMode ? darkTheme : lightTheme,
      home: HomeScreen(),
    );
  }
}

final lightTheme = ThemeData(
    primaryColor: lmPrimary,
    accentColor: lmAccent,
    backgroundColor: lmBackground,
    scaffoldBackgroundColor: lmBackground,
    appBarTheme: AppBarTheme(
      elevation: 0,
      titleTextStyle: textMeduim18Secondary,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: lmBackground,
      selectedItemColor: lmBottomBarSelectedColor,
      unselectedItemColor: lmBottomBarUnselectedColor,
      showSelectedLabels: false,
      showUnselectedLabels: false,
    ),
    toggleButtonsTheme: ToggleButtonsThemeData());

final darkTheme = ThemeData(
  primaryColor: dmPrimary,
  accentColor: dmAccent,
  backgroundColor: dmBackground,
  scaffoldBackgroundColor: dmBackground,
  appBarTheme: AppBarTheme(
    elevation: 0,
    titleTextStyle: textMeduim18Secondary,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    backgroundColor: dmBackground,
    selectedItemColor: dmBottomBarSelectedColor,
    unselectedItemColor: dmBottomBarUnselectedColor,
    showSelectedLabels: false,
    showUnselectedLabels: false,
  ),
);

class AppConfig {
  final bool isDarkMode;

  AppConfig({this.isDarkMode = false});
}
