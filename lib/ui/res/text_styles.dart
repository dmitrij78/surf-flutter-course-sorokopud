import 'package:flutter/painting.dart';
import 'package:places/ui/res/colors.dart';

TextStyle _text = const TextStyle(
  fontFamily: 'Roboto',
  fontStyle: FontStyle.normal,
  color: textColorPrimary,
);

//Bold
TextStyle textBold = _text.copyWith(fontWeight: FontWeight.w700),
    textBold32 = _text.copyWith(fontSize: 32.0);
