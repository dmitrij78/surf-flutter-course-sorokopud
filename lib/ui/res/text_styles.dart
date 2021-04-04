import 'package:flutter/painting.dart';
import 'package:places/ui/res/colors.dart';

TextStyle _text = const TextStyle(
  fontFamily: 'Roboto',
  fontStyle: FontStyle.normal,
  color: textColorPrimary,
);

//Regular
TextStyle textRegular = _text.copyWith(fontWeight: FontWeight.normal),
    textRegularl14 = textRegular.copyWith(fontSize: 14.0),
    textRegular14Secondary1 =
        textRegularl14.copyWith(color: textColorSecondary1);

//Medium
TextStyle textMedium = _text.copyWith(fontWeight: FontWeight.w500),
    textMeduim16 = textMedium.copyWith(fontSize: 16.0),
    textMeduim16Secondary = textMeduim16.copyWith(color: textColorSecondary);

//Bold
TextStyle textBold = _text.copyWith(fontWeight: FontWeight.w700),
    textBold14 = textBold.copyWith(fontSize: 14.0),
    textBold14Inverse = textBold14.copyWith(color: textColorInverse),
    textBold32 = textBold.copyWith(fontSize: 32.0),
    textBold32Secondary = textBold32.copyWith(color: textColorSecondary);
