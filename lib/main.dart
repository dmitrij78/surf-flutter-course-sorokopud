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
      home: Container(
        color: Colors.white,
        padding: EdgeInsets.only(top: 64, left: 16, right: 16),
        child: RichText(
          text: TextSpan(
              style: TextStyle(
                  color: const Color(0xff252849),
                  fontFamily: 'Roboto',
                  fontSize: 32,
                  fontWeight: FontWeight.w700),
              children: [
                TextSpan(children: [
                  TextSpan(
                      text: 'C', style: TextStyle(color: Color(0xff4caf50))),
                  TextSpan(text: 'писок\n'),
                ]),
                TextSpan(children: [
                  TextSpan(
                      text: 'и', style: TextStyle(color: Color(0xfffbc02d))),
                  TextSpan(text: 'нтересных мест'),
                ]),
              ]),
        ),
      ),
    );
  }
}
