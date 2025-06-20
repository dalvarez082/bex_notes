import 'package:bex_notes/styles/colors/app_colors.dart';
import 'package:bex_notes/styles/colors/app_colors_dark.dart';
import 'package:flutter/material.dart';

class DarkTheme {
  static ThemeData theme = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColorsDark.surfaceContainerLowest,
    fontFamily: 'Nunito',
   
    colorScheme: const ColorScheme.dark(
      //Primary
      primary: AppColors.primary,
      onPrimary: AppColors.onPrimary,
      primaryContainer: AppColors.primaryContainer,
      onPrimaryContainer: AppColors.onPrimaryContainer,
      primaryFixed: AppColors.primaryFixed,
      onPrimaryFixed: AppColors.onPrimaryFixed,
      primaryFixedDim: AppColors.primaryFixedDim,
      onPrimaryFixedVariant: AppColors.onPrimaryFixedVariant,
      //Secondary
      secondary: AppColors.secondary,
      onSecondary: AppColors.onSecondary,
      secondaryContainer: AppColors.secondaryContainer,
      onSecondaryContainer: AppColors.onSecondaryContainer,
      secondaryFixed: AppColors.secondaryFixed,
      onSecondaryFixed: AppColors.onSecondaryFixed,
      secondaryFixedDim: AppColors.secondaryFixedDim,
      onSecondaryFixedVariant: AppColors.onSecondaryFixedVariant,
      //Tertiary
      tertiary: AppColors.tertiary,
      onTertiary: AppColors.onTertiary,
      tertiaryContainer: AppColors.tertiaryContainer,
      onTertiaryContainer: AppColors.onTertiaryContainer,
      tertiaryFixed: AppColors.tertiaryFixed,
      onTertiaryFixed: AppColors.onTertiaryFixed,
      tertiaryFixedDim: AppColors.tertiaryFixedDim,
      onTertiaryFixedVariant: AppColors.onTertiaryFixedVariant,
      //Surface
      surfaceDim: AppColorsDark.surfaceDim,
      surface: AppColorsDark.surface,
      surfaceBright: AppColorsDark.surfaceBright,
      surfaceContainerLowest: AppColorsDark.surfaceContainerLowest,
      surfaceContainerLow: AppColorsDark.surfaceContainerLow,
      surfaceContainer: AppColorsDark.surfaceContainer,
      surfaceContainerHigh: AppColorsDark.surfaceContainerHigh,
      surfaceContainerHighest: AppColorsDark.surfaceContainerHighest,
      onSurface: AppColorsDark.onSurface,
      onSurfaceVariant: AppColorsDark.onSurfaceVariant,
      //Outline
      outline: AppColorsDark.outline,
      outlineVariant: AppColorsDark.outlineVariant,
      //Error
      error: AppColors.error,
      onError: AppColors.onError,
      errorContainer: AppColors.errorContainer,
      onErrorContainer: AppColors.onErrorContainer,
      //others
      scrim: AppColors.scrim,
      shadow: AppColors.shadow,
      inversePrimary: AppColorsDark.inversePrimary,
      inverseSurface: AppColorsDark.inverseSurface,
      onInverseSurface: AppColorsDark.inverseOnSurface,
    ),
  );
}
