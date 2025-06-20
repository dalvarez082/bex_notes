import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppResponsiveTextStyles {
  const AppResponsiveTextStyles();

  // DISPLAY
  TextStyle get displayLarge => _baseStyle(32, 1.25, FontWeight.w700);
  TextStyle get displayMedium => _baseStyle(28, 1.21, FontWeight.w700);
  TextStyle get displaySmall => _baseStyle(24, 1.25, FontWeight.w700);

  // HEADLINE
  TextStyle get headlineLarge => _baseStyle(22, 1.27, FontWeight.w700);
  TextStyle get headlineMedium => _baseStyle(20, 1.3, FontWeight.w700);
  TextStyle get headlineSmall => _baseStyle(18, 1.33, FontWeight.w700);

  // TITLE
  TextStyle get titleLarge => _baseStyle(18, 1.33, FontWeight.w700);
  TextStyle get titleMedium =>
      _baseStyle(16, 1.38, FontWeight.w700, letterSpacing: 0.1);
  TextStyle get titleSmall =>
      _baseStyle(14, 1.43, FontWeight.w700, letterSpacing: 0.1);
  TextStyle get titleXSmall =>
      _baseStyle(12, 1.33, FontWeight.w700, letterSpacing: 0.1);
  TextStyle get titleXXSmall =>
      _baseStyle(10, 1.4, FontWeight.w700, letterSpacing: 0.1);

  // LABEL
  TextStyle get labelLarge =>
      _baseStyle(14, 1.43, FontWeight.w600, letterSpacing: 0.1);
  TextStyle get labelMedium =>
      _baseStyle(12, 1.33, FontWeight.w600, letterSpacing: 0.4);
  TextStyle get labelSmall =>
      _baseStyle(11, 1.45, FontWeight.w600, letterSpacing: 0.4);
  TextStyle get labelXSmall =>
      _baseStyle(10, 1.6, FontWeight.w600, letterSpacing: 0.4);

  // BODY
  TextStyle get bodyExtraLarge =>
      _baseStyle(16, 1.38, FontWeight.w500, letterSpacing: 0.1);
  TextStyle get bodyLarge =>
      _baseStyle(14, 1.43, FontWeight.w500, letterSpacing: 0.25);
  TextStyle get bodyMedium =>
      _baseStyle(12, 1.5, FontWeight.w500, letterSpacing: 0.25);
  TextStyle get bodySmall =>
      _baseStyle(10, 1.6, FontWeight.w500, letterSpacing: 0.4);

 
  TextStyle _baseStyle(
    double fontSize,
    double height,
    FontWeight fontWeight, {
    double? letterSpacing,
  }) {
    return TextStyle(
      fontSize: fontSize.sp,
      height: height,
      fontWeight: fontWeight,
      letterSpacing: letterSpacing,
     
    );
  }
}
