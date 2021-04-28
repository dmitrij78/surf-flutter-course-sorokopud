import 'package:flutter/widgets.dart';
import 'package:places/ui/res/colors.dart';

//Новые текстовые стили
TextStyle _text = const TextStyle(
  fontFamily: 'Roboto',
  fontStyle: FontStyle.normal,
);

TextStyle _textBold = _text.copyWith(fontWeight: FontWeight.w700);
TextStyle _textRegular = _text.copyWith(fontWeight: FontWeight.normal);
TextStyle _textMedium = _text.copyWith(fontWeight: FontWeight.w500);

TextStyle _headLine5 = _textBold.copyWith(
  fontSize: 24.0,
  height: 1.2,
);
TextStyle lmHeadLine5 = _headLine5.copyWith(color: lmTextColorPrimary);
TextStyle dmHeadLine5 = _headLine5.copyWith(color: dmTextColorPrimary);

TextStyle _headLine6 = _textMedium.copyWith(
  fontSize: 18.0,
  height: 1.25,
);
TextStyle lmHeadLine6 = _headLine6.copyWith(color: lmTextColorSecondary);
TextStyle dmHeadLine6 = _headLine6.copyWith(color: dmTextColorSecondary);

TextStyle _subTitle1 = _textBold.copyWith(
  fontSize: 14.0,
  height: 1.3,
);
TextStyle lmSubTitle1 = _subTitle1.copyWith(color: lmTextColorPrimary);
TextStyle dmSubTitle1 = _subTitle1.copyWith(color: dmTextColorSecondary);

TextStyle _subTitle2 = _textRegular.copyWith(
  fontSize: 14.0,
  height: 1.3,
);
TextStyle lmSubTitle2 = _subTitle2.copyWith(color: lmTextColorSecondary);
TextStyle dmSubTitle2 = _subTitle2.copyWith(color: dmTextColorSecondary);

TextStyle _body1 = _textMedium.copyWith(
  fontSize: 16,
  height: 1.25,
);
TextStyle lmBody1 = _body1.copyWith(color: lmTextColorPrimary);
TextStyle dmBody1 = _body1.copyWith(color: dmTextColorPrimary);

TextStyle _body2 = _textRegular.copyWith(
  fontSize: 14.0,
  height: 1.3,
);
TextStyle lmBody2 = _body2.copyWith(color: lmTextColorPrimary);
TextStyle dmBody2 = _body2.copyWith(color: dmTextColorPrimary);

TextStyle textRegularl14 = _textRegular.copyWith(
  fontSize: 14.0,
  height: 1.3,
);
