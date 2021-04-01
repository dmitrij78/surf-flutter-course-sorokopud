import 'package:flutter/material.dart';
import 'package:places/ui/res/styles.dart';
import 'package:places/ui/res/text_styles.dart';

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
      theme: themeData,
      home: Container(
        color: Colors.white,
        padding: EdgeInsets.only(top: 64, left: 16, right: 16),
        child: RichText(
          text: TextSpan(style: textBold32, children: [
            TextSpan(children: [
              TextSpan(text: 'C', style: TextStyle(color: Color(0xff4caf50))),
              TextSpan(text: 'писок\n'),
            ]),
            TextSpan(children: [
              TextSpan(text: 'и', style: TextStyle(color: Color(0xfffbc02d))),
              TextSpan(text: 'нтересных мест'),
            ]),
          ]),
        ),
      ),
    );
  }
}
