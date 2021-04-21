import 'package:flutter/widgets.dart';
import 'package:places/ui/res/colors.dart';

TextStyle _text = const TextStyle(
  fontFamily: 'Roboto',
  fontStyle: FontStyle.normal,
);

//Regular
TextStyle textRegular = _text.copyWith(fontWeight: FontWeight.normal);
TextStyle textRegularl14 = textRegular.copyWith(
  fontSize: 14.0,
  height: 1.3,
);
TextStyle textRegular14Secondary = textRegularl14.copyWith(
  color: lmTextColorSecondary,
);
TextStyle textRegular14Secondary1 = textRegularl14.copyWith(
  color: lmTextColorSecondary1,
);
TextStyle textRegular14Accent = textRegularl14.copyWith(
  color: lmTextColorAccent,
);

//Medium
TextStyle textMedium = _text.copyWith(fontWeight: FontWeight.w500),
    textMeduim16 = textMedium.copyWith(
      fontSize: 16.0,
      height: 1.25,
    );

TextStyle textMeduim16Secondary = textMeduim16.copyWith(
  color: lmTextColorSecondary,
);
TextStyle textMeduim18 = textMedium.copyWith(
  fontSize: 18.0,
  height: 1.25,
);
TextStyle textMeduim18Secondary = textMeduim18.copyWith(
  color: lmTextColorSecondary,
);

//Bold
TextStyle textBold = _text.copyWith(fontWeight: FontWeight.w700),
    textBold14 = textBold.copyWith(
      fontSize: 14.0,
      height: 1.3,
    );
TextStyle textBold14Inverse = textBold14.copyWith(
  color: lmTextColorInverse,
);
TextStyle textBold14InactiveBlack = textBold14.copyWith(
  color: lmTextColorInactiveBlack.withOpacity(0.56),
);
TextStyle textBold24 = textBold.copyWith(
  fontSize: 24.0,
  height: 1.2,
);
TextStyle textBold24Secondary = textBold24.copyWith(
  color: lmTextColorSecondary,
  height: 1.2,
);
TextStyle textBold32 = textBold.copyWith(
  fontSize: 32.0,
  height: 1.13,
);
TextStyle textBold32Secondary = textBold32.copyWith(
  color: lmTextColorSecondary,
);

//Новые текстовые стили
TextStyle _headLine6 = textMeduim18;
TextStyle lmHeadLine6 = _headLine6.copyWith(color: lmTextColorSecondary);
TextStyle dmHeadLine6 = _headLine6.copyWith(color: dmTextColorSecondary);

TextStyle _subTitle1 = textMeduim16;
TextStyle lmSubTitle1 = _subTitle1.copyWith(color: lmTextColorSecondary);
TextStyle dmSubTitle1 = _subTitle1.copyWith(color: dmTextColorSecondary);

TextStyle _subTitle2 = textRegularl14;
TextStyle lmSubTitle2 = _subTitle2.copyWith(color: lmTextColorSecondary1);
TextStyle dmSubTitle2 = _subTitle2.copyWith(color: dmTextColorSecondary1);
