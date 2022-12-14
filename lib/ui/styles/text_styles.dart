import 'package:bytebank_app/ui/styles/colors_app.dart';
import 'package:flutter/material.dart';

class TextStyles {
  static TextStyles? _instance;

  TextStyles._();
  static TextStyles get i {
    _instance ??= TextStyles._();
    return _instance!;
  }

  String get primaryFont => 'Poppins';
  String get secundaryFont => 'MPlus1P';

  // primary Font
  TextStyle get textPrimaryFontRegular =>
      TextStyle(fontWeight: FontWeight.normal, fontFamily: primaryFont);

  TextStyle get textPrimaryFontMedium =>
      TextStyle(fontWeight: FontWeight.w500, fontFamily: primaryFont);

  TextStyle get textPrimaryFontSemiBold =>
      TextStyle(fontWeight: FontWeight.w600, fontFamily: primaryFont);

  TextStyle get textPrimaryFontBold =>
      TextStyle(fontWeight: FontWeight.bold, fontFamily: primaryFont);

  TextStyle get textPrimaryFontExtraBold =>
      TextStyle(fontWeight: FontWeight.w800, fontFamily: primaryFont);

  // secondary Font Secondary
  TextStyle get textSecondaryFontRegular =>
      TextStyle(fontWeight: FontWeight.normal, fontFamily: secundaryFont);

  TextStyle get textSecondaryFontMedium =>
      TextStyle(fontWeight: FontWeight.w600, fontFamily: secundaryFont);

  TextStyle get textSecondaryFontBold =>
      TextStyle(fontWeight: FontWeight.bold, fontFamily: secundaryFont);

  TextStyle get textSecondaryFontExtraBold =>
      TextStyle(fontWeight: FontWeight.w800, fontFamily: secundaryFont);

  TextStyle get labelTextField =>
      textSecondaryFontRegular.copyWith(color: ColorsApp.i.greyDark);

  TextStyle get titleWhite =>
      textPrimaryFontBold.copyWith(fontSize: 22, color: ColorsApp.i.white);

  TextStyle get subtitleWhite =>
      textPrimaryFontBold.copyWith(fontSize: 18, color: ColorsApp.i.white);

  TextStyle get subtitlePrimary =>
      textPrimaryFontBold.copyWith(fontSize: 18, color: ColorsApp.i.primary);
}

extension TextStylesExtension on BuildContext {
  TextStyles get textStyles => TextStyles.i;
}
