import 'package:flutter/material.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/res/text_styles.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: lmPrimary,
  accentColor: lmAccent,
  backgroundColor: lmBackground,
  scaffoldBackgroundColor: lmBackground,
  appBarTheme: AppBarTheme(
    elevation: 0,
    titleTextStyle: lmHeadLine6.copyWith(color: lmTextColorAppBar),
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
    headline5: lmHeadLine5,
    headline6: lmHeadLine6,
    subtitle1: lmSubTitle1,
    subtitle2: lmSubTitle2,
    bodyText1: lmBody1,
    bodyText2: lmBody2,
  ),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: dmPrimary,
  accentColor: dmAccent,
  backgroundColor: dmBackground,
  scaffoldBackgroundColor: dmBackground,
  appBarTheme: AppBarTheme(
    elevation: 0,
    titleTextStyle: lmHeadLine6.copyWith(color: dmTextColorAppBar),
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
    headline5: dmHeadLine5,
    headline6: dmHeadLine6,
    subtitle1: dmSubTitle1,
    subtitle2: dmSubTitle2,
    bodyText1: dmBody1,
    bodyText2: dmBody2,
  ),
);
