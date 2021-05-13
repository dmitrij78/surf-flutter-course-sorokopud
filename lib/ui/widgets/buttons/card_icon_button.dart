import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CardIconButton extends StatelessWidget {
  static const size = 18;

  const CardIconButton({
    Key key,
    @required this.icon,
    @required this.onPressed,
  }) : super(key: key);

  final Widget icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 18,
      width: 18,
      child: IconButton(
        icon: this.icon,
        padding: EdgeInsets.all(.0),
        splashColor: Colors.amber,
        onPressed: this.onPressed,
      ),
    );
  }
}
