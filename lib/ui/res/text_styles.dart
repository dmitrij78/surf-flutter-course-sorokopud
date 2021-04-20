import 'package:flutter/painting.dart';
import 'package:places/ui/res/colors.dart';

TextStyle _text = const TextStyle(
  fontFamily: 'Roboto',
  fontStyle: FontStyle.normal,
  color: lmTextColorPrimary,
);

//Regular
TextStyle textRegular = _text.copyWith(fontWeight: FontWeight.normal),
    textRegularl14 = textRegular.copyWith(
      fontSize: 14.0,
      height: 1.3,
    ),
    textRegular14Secondary = textRegularl14.copyWith(
      color: lmTextColorSecondary,
    ),
    textRegular14Secondary1 = textRegularl14.copyWith(
      color: lmTextColorSecondary1,
    ),
    textRegular14Accent = textRegularl14.copyWith(
      color: lmTextColorAccent,
    );

//Medium
TextStyle textMedium = _text.copyWith(fontWeight: FontWeight.w500),
    textMeduim16 = textMedium.copyWith(
      fontSize: 16.0,
      height: 1.25,
    ),
    textMeduim16Secondary = textMeduim16.copyWith(
      color: lmTextColorSecondary,
    ),
    textMeduim18 = textMedium.copyWith(
      fontSize: 18.0,
      height: 1.3,
    ),
    textMeduim18Secondary = textMeduim18.copyWith(
      color: lmTextColorSecondary,
    );

//Bold
TextStyle textBold = _text.copyWith(fontWeight: FontWeight.w700),
    textBold14 = textBold.copyWith(
      fontSize: 14.0,
      height: 1.3,
    ),
    textBold14Inverse = textBold14.copyWith(
      color: lmTextColorInverse,
    ),
    textBold14InactiveBlack = textBold14.copyWith(
      color: lmTextColorInactiveBlack.withOpacity(0.56),
    ),
    textBold24 = textBold.copyWith(
      fontSize: 24.0,
      height: 1.2,
    ),
    textBold24Secondary = textBold24.copyWith(
      color: lmTextColorSecondary,
      height: 1.2,
    ),
    textBold32 = textBold.copyWith(
      fontSize: 32.0,
      height: 1.13,
    ),
    textBold32Secondary = textBold32.copyWith(
      color: lmTextColorSecondary,
    );
