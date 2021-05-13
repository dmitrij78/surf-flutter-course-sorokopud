import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/res/text_styles.dart';

final ButtonStyle lmButtonStyle = ButtonStyle(
  foregroundColor: MaterialStateProperty.resolveWith<Color>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.disabled)) return dmTextColorSecondary1;
      return lmTextColorPrimary;
    },
  ),
  textStyle: MaterialStateProperty.all(lmBody2),
  overlayColor: MaterialStateProperty.all(
    lmTextColorPrimary.withOpacity(0.1),
  ),
);

final ButtonStyle dmButtonStyle = ButtonStyle(
  foregroundColor: MaterialStateProperty.resolveWith<Color>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.disabled)) return dmTextColorSecondary1;
      return dmTextColorPrimary;
    },
  ),
  textStyle: MaterialStateProperty.all(lmBody2),
  overlayColor: MaterialStateProperty.all(
    dmTextColorPrimary.withOpacity(0.1),
  ),
);
