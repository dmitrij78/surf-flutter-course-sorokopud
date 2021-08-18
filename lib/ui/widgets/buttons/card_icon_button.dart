import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CardIconButton extends StatelessWidget {
  const CardIconButton({
    Key? key,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  final Widget icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: Size.square(34.0),
      child: ClipOval(
        child: Material(
          clipBehavior: Clip.antiAlias,
          color: Colors.transparent,
          child: InkWell(
            child: Padding(
              padding: const EdgeInsets.all(7.0),
              child: icon,
            ),
            onTap: onPressed,
          ),
        ),
      ),
    );
  }
}
