import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SightListScreen extends StatefulWidget {
  @override
  _SightListScreenState createState() => _SightListScreenState();
}

class _SightListScreenState extends State<SightListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        toolbarHeight: 322,
        title: Padding(
          padding: const EdgeInsets.only(bottom: 210),
          child: Text(
            'Список\nинтересных мест',
            style: TextStyle(
                color: const Color(0xff252849),
                fontFamily: 'Roboto',
                fontSize: 32,
                fontWeight: FontWeight.w700),
          ),
        ),
      ),
      body: SizedBox.shrink(),
    );
  }
}
