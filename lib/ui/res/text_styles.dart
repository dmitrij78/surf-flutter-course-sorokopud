import 'package:flutter/painting.dart';
import 'package:places/ui/res/colors.dart';

TextStyle _text = const TextStyle(
  fontFamily: 'Roboto',
  fontStyle: FontStyle.normal,
  color: textColorPrimary,
);

//Regular
TextStyle textRegular = _text.copyWith(fontWeight: FontWeight.normal),
    textRegularl14 = textRegular.copyWith(
      fontSize: 14.0,
      height: 1.3,
    ),
    textRegular14Secondary = textRegularl14.copyWith(
      color: textColorSecondary,
    ),
    textRegular14Secondary1 = textRegularl14.copyWith(
      color: textColorSecondary1,
    );

//Medium
TextStyle textMedium = _text.copyWith(fontWeight: FontWeight.w500),
    textMeduim16 = textMedium.copyWith(fontSize: 16.0),
    textMeduim16Secondary = textMeduim16.copyWith(color: textColorSecondary);

//Bold
TextStyle textBold = _text.copyWith(fontWeight: FontWeight.w700),
    textBold14 = textBold.copyWith(
      fontSize: 14.0,
      height: 1.3,
    ),
    textBold14Inverse = textBold14.copyWith(color: textColorInverse),
    textBold24 = textBold.copyWith(
      fontSize: 24.0,
      height: 1.2,
    ),
    textBold24Secondary = textBold24.copyWith(
      color: textColorSecondary,
      height: 1.2,
    ),
    textBold32 = textBold.copyWith(
      fontSize: 32.0,
      height: 1.13,
    ),
    textBold32Secondary = textBold32.copyWith(
      color: textColorSecondary,
    );
