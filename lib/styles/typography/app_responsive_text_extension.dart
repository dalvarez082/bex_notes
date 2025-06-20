import 'package:bex_notes/styles/typography/app_responsive_text_styles_context.dart';
import 'package:flutter/material.dart';

extension AppResponsiveTextExtension on BuildContext {
  AppResponsiveTextStylesContext get textresponsive =>
      AppResponsiveTextStylesContext(this);
}
