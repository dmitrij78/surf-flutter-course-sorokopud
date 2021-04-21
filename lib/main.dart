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
  final bool _isDarkMode = false;

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
  brightness: Brightness.light,
  primaryColor: lmPrimary,
  accentColor: lmAccent,
  backgroundColor: lmBackground,
  scaffoldBackgroundColor: lmBackground,
  appBarTheme: AppBarTheme(
    elevation: 0,
    titleTextStyle: lmHeadLine6,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    backgroundColor: lmBackground,
    selectedItemColor: lmBottomBarSelectedColor,
    unselectedItemColor: lmBottomBarUnselectedColor,
    showSelectedLabels: false,
    showUnselectedLabels: false,
  ),
  cardTheme: CardTheme(
    elevation: 0,
    color: lmCardBackground,
    clipBehavior: Clip.antiAlias,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  ),
  textTheme: TextTheme(
    headline6: lmHeadLine6,
    subtitle1: lmSubTitle1,
    subtitle2: lmSubTitle2,
  ),
);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: dmPrimary,
  accentColor: dmAccent,
  backgroundColor: dmBackground,
  scaffoldBackgroundColor: dmBackground,
  appBarTheme: AppBarTheme(
    elevation: 0,
    titleTextStyle: dmHeadLine6,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    backgroundColor: dmBackground,
    selectedItemColor: dmBottomBarSelectedColor,
    unselectedItemColor: dmBottomBarUnselectedColor,
    showSelectedLabels: false,
    showUnselectedLabels: false,
  ),
  cardTheme: CardTheme(
    elevation: 0,
    color: dmCardBackground,
    clipBehavior: Clip.antiAlias,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  ),
  textTheme: TextTheme(
    headline6: dmHeadLine6,
    subtitle1: dmSubTitle1,
    subtitle2: dmSubTitle2,
  ),
);

class AppConfig {
  final bool isDarkMode;

  AppConfig({this.isDarkMode = false});
}
