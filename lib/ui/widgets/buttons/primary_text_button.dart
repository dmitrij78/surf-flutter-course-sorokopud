import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/ui/res/colors.dart';

class PrimaryTextButton extends StatelessWidget {
  final String label;
  final String iconAssetName;
  final VoidCallback onPressed;

  const PrimaryTextButton({
    Key key,
    @required this.label,
    @required this.iconAssetName,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDisabled = onPressed == null;
    return SizedBox(
      height: 40,
      child: isDisabled
          ? _DisabledButton(
              label: label,
              iconAssetName: iconAssetName,
            )
          : _EnabledButton(
              label: label,
              iconAssetName: iconAssetName,
              onPressed: onPressed,
            ),
    );
  }
}

class _DisabledButton extends StatelessWidget {
  const _DisabledButton({
    Key key,
    @required this.label,
    @required this.iconAssetName,
  }) : super(key: key);

  final String label;
  final String iconAssetName;

  @override
  Widget build(BuildContext context) {
    // ignore: missing_required_param
    return TextButton.icon(
      label: Text(label),
      icon: SvgPicture.asset(
        iconAssetName,
        color: dmTextColorSecondary1,
      ),
    );
  }
}

class _EnabledButton extends StatelessWidget {
  const _EnabledButton({
    Key key,
    @required this.label,
    @required this.iconAssetName,
    @required this.onPressed,
  }) : super(key: key);

  final String label;
  final String iconAssetName;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return TextButton.icon(
      label: Text(label),
      icon: SvgPicture.asset(
        iconAssetName,
        color: isDark ? dmTextColorPrimary : lmTextColorPrimary,
      ),
      onPressed: onPressed,
    );
  }
}
