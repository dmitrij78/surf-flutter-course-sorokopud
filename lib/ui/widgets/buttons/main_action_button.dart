import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/ui/res/colors.dart';

class MainActionButton extends StatelessWidget {
  final String text;
  final String iconAssetName;
  final VoidCallback onPressed;

  const MainActionButton({
    Key key,
    @required this.text,
    @required this.onPressed,
    this.iconAssetName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ElevatedButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            iconAssetName == null
                ? SizedBox.shrink()
                : SvgPicture.asset(iconAssetName),
            const SizedBox(width: 10),
            Text(text),
          ],
        ),
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: const BorderRadius.all(Radius.circular(12.0)),
            ),
            primary: accentColorGreen,
            elevation: 0,
            textStyle: Theme.of(context)
                .textTheme
                .subtitle1
                .copyWith(color: dmAccent)),
        onPressed: onPressed,
      ),
    );
  }
}
