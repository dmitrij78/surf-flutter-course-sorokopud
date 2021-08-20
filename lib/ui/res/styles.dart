import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/res/text_styles.dart';

final ButtonStyle lmButtonStyle = ButtonStyle(
  foregroundColor: MaterialStateProperty.resolveWith<Color>(
    (Set<MaterialState> states) {
      return states.contains(MaterialState.disabled)
          ? dmTextColorSecondary1
          : lmTextColorPrimary;
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
      return states.contains(MaterialState.disabled)
          ? dmTextColorSecondary1
          : dmTextColorPrimary;
    },
  ),
  textStyle: MaterialStateProperty.all(lmBody2),
  overlayColor: MaterialStateProperty.all(
    dmTextColorPrimary.withOpacity(0.1),
  ),
);

final ButtonStyle lmAppBarActionButtonStyle = lmButtonStyle.copyWith(
  foregroundColor: MaterialStateProperty.resolveWith<Color>(
    (Set<MaterialState> states) {
      return states.contains(MaterialState.disabled)
          ? dmTextColorSecondary1
          : textColorAccentGreen;
    },
  ),
  textStyle: MaterialStateProperty.all(lmBody1),
);

final ButtonStyle dmAppBarActionButtonStyle = dmButtonStyle.copyWith(
  foregroundColor: MaterialStateProperty.resolveWith<Color>(
    (Set<MaterialState> states) {
      return states.contains(MaterialState.disabled)
          ? dmTextColorSecondary1
          : textColorAccentGreen;
    },
  ),
  textStyle: MaterialStateProperty.all(dmBody1),
);
