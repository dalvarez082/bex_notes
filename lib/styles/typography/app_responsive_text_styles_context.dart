import 'package:bex_notes/styles/typography/app_responsive_text_styles.dart';
import 'package:flutter/material.dart';

class AppResponsiveTextStylesContext {
  final BuildContext context;
  final ColorScheme colors;
  final AppResponsiveTextStyles base;

  AppResponsiveTextStylesContext(this.context)
      : colors = Theme.of(context).colorScheme,
        base = const AppResponsiveTextStyles();

  // DISPLAY
  TextStyle get displayLarge =>
      base.displayLarge.copyWith(color: colors.onSurface);
  TextStyle get displayLargeVariant =>
      displayLarge.copyWith(color: colors.onSurfaceVariant);
  TextStyle get displayLargeVariant2 =>
      displayLarge.copyWith(color: colors.outlineVariant);

  TextStyle get displayMedium =>
      base.displayMedium.copyWith(color: colors.onSurface);
  TextStyle get displayMediumVariant =>
      displayMedium.copyWith(color: colors.onSurfaceVariant);
  TextStyle get displayMediumVariant2 =>
      displayMedium.copyWith(color: colors.outlineVariant);

  TextStyle get displaySmall =>
      base.displaySmall.copyWith(color: colors.onSurface);
  TextStyle get displaySmallVariant =>
      displaySmall.copyWith(color: colors.onSurfaceVariant);
  TextStyle get displaySmallVariant2 =>
      displaySmall.copyWith(color: colors.outlineVariant);

  // HEADLINE
  TextStyle get headlineLarge =>
      base.headlineLarge.copyWith(color: colors.onSurface);
  TextStyle get headlineLargeVariant =>
      headlineLarge.copyWith(color: colors.onSurfaceVariant);
  TextStyle get headlineLargeVariant2 =>
      headlineLarge.copyWith(color: colors.outlineVariant);

  TextStyle get headlineMedium =>
      base.headlineMedium.copyWith(color: colors.onSurface);
  TextStyle get headlineMediumVariant =>
      headlineMedium.copyWith(color: colors.onSurfaceVariant);
  TextStyle get headlineMediumVariant2 =>
      headlineMedium.copyWith(color: colors.outlineVariant);

  TextStyle get headlineSmall =>
      base.headlineSmall.copyWith(color: colors.onSurface);
  TextStyle get headlineSmallVariant =>
      headlineSmall.copyWith(color: colors.onSurfaceVariant);
  TextStyle get headlineSmallVariant2 =>
      headlineSmall.copyWith(color: colors.outlineVariant);

  // TITLE
  TextStyle get titleLarge => base.titleLarge.copyWith(color: colors.onSurface);
  TextStyle get titleLargeVariant =>
      titleLarge.copyWith(color: colors.onSurfaceVariant);
  TextStyle get titleLargeVariant2 =>
      titleLarge.copyWith(color: colors.outlineVariant);

  TextStyle get titleMedium =>
      base.titleMedium.copyWith(color: colors.onSurface);
  TextStyle get titleMediumVariant =>
      titleMedium.copyWith(color: colors.onSurfaceVariant);
  TextStyle get titleMediumVariant2 =>
      titleMedium.copyWith(color: colors.outlineVariant);

  TextStyle get titleSmall => base.titleSmall.copyWith(color: colors.onSurface);
  TextStyle get titleSmallVariant =>
      titleSmall.copyWith(color: colors.onSurfaceVariant);
  TextStyle get titleSmallVariant2 =>
      titleSmall.copyWith(color: colors.outlineVariant);

  TextStyle get titleXSmall =>
      base.titleXSmall.copyWith(color: colors.onSurface);
  TextStyle get titleXSmallVariant =>
      titleXSmall.copyWith(color: colors.onSurfaceVariant);
  TextStyle get titleXSmallVariant2 =>
      titleXSmall.copyWith(color: colors.outlineVariant);

  TextStyle get titleXXSmall =>
      base.titleXXSmall.copyWith(color: colors.onSurface);
  TextStyle get titleXXSmallVariant =>
      titleXXSmall.copyWith(color: colors.onSurfaceVariant);
  TextStyle get titleXXSmallVariant2 =>
      titleXXSmall.copyWith(color: colors.outlineVariant);

  // LABEL
  TextStyle get labelLarge => base.labelLarge.copyWith(color: colors.onSurface);
  TextStyle get labelLargeVariant =>
      labelLarge.copyWith(color: colors.onSurfaceVariant);
  TextStyle get labelLargeVariant2 =>
      labelLarge.copyWith(color: colors.outlineVariant);

  TextStyle get labelMedium =>
      base.labelMedium.copyWith(color: colors.onSurface);
  TextStyle get labelMediumVariant =>
      labelMedium.copyWith(color: colors.onSurfaceVariant);
  TextStyle get labelMediumVariant2 =>
      labelMedium.copyWith(color: colors.outlineVariant);

  TextStyle get labelSmall => base.labelSmall.copyWith(color: colors.onSurface);
  TextStyle get labelSmallVariant =>
      labelSmall.copyWith(color: colors.onSurfaceVariant);
  TextStyle get labelSmallVariant2 =>
      labelSmall.copyWith(color: colors.outlineVariant);

  TextStyle get labelXSmall =>
      base.labelXSmall.copyWith(color: colors.onSurface);
  TextStyle get labelXSmallVariant =>
      labelXSmall.copyWith(color: colors.onSurfaceVariant);
  TextStyle get labelXSmallVariant2 =>
      labelXSmall.copyWith(color: colors.outlineVariant);

  // BODY
  TextStyle get bodyExtraLarge =>
      base.bodyExtraLarge.copyWith(color: colors.onSurface);
  TextStyle get bodyExtraLargeVariant =>
      bodyExtraLarge.copyWith(color: colors.onSurfaceVariant);
  TextStyle get bodyExtraLargeVariant2 =>
      bodyExtraLarge.copyWith(color: colors.outlineVariant);

  TextStyle get bodyLarge => base.bodyLarge.copyWith(color: colors.onSurface);
  TextStyle get bodyLargeVariant =>
      bodyLarge.copyWith(color: colors.onSurfaceVariant);
  TextStyle get bodyLargeVariant2 =>
      bodyLarge.copyWith(color: colors.outlineVariant);

  TextStyle get bodyMedium => base.bodyMedium.copyWith(color: colors.onSurface);
  TextStyle get bodyMediumVariant =>
      bodyMedium.copyWith(color: colors.onSurfaceVariant);
  TextStyle get bodyMediumVariant2 =>
      bodyMedium.copyWith(color: colors.outlineVariant);

  TextStyle get bodySmall => base.bodySmall.copyWith(color: colors.onSurface);
  TextStyle get bodySmallVariant =>
      bodySmall.copyWith(color: colors.onSurfaceVariant);
  TextStyle get bodySmallVariant2 =>
      bodySmall.copyWith(color: colors.outlineVariant);
}
