import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:places/domain/domain.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/res/strings/strings.dart';
import 'package:places/ui/res/text_styles.dart';
import 'package:places/ui/screen/sight_card.dart';

class SightListScreen extends StatefulWidget {
  final List<Sight> sights;

  const SightListScreen({Key key, this.sights}) : super(key: key);

  @override
  _SightListScreenState createState() => _SightListScreenState();
}

class _SightListScreenState extends State<SightListScreen> {
  static const double APPBAR_HEIGHT = 74;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        elevation: 0,
        centerTitle: false,
        toolbarHeight: APPBAR_HEIGHT,
        title: Text(
          appBarTitleText,
          style: textBold32Secondary,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const SizedBox(height: 16),
                SightCard(sight: widget.sights[2]),
                const SizedBox(height: 16),
                SightCard(sight: widget.sights[0]),
                SizedBox(height: 16),
                SightCard(sight: widget.sights[1]),
                const SizedBox(height: 16),
                SightCard(sight: widget.sights[2]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
