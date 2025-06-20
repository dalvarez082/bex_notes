import 'package:bex_notes/styles/colors/app_colors.dart';
import 'package:bex_notes/styles/colors/app_colors_light.dart';
import 'package:flutter/material.dart';


class LightTheme {
  static ThemeData theme = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColorsLight.surfaceContainerLowest,
    fontFamily: 'Nunito',
   
    colorScheme: const ColorScheme.light(
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
      //Error
      error: AppColors.error,
      onError: AppColors.onError,
      errorContainer: AppColors.errorContainer,
      onErrorContainer: AppColors.onErrorContainer,
      //Surface
      surfaceDim: AppColorsLight.surfaceDim,
      surface: AppColorsLight.surface,
      surfaceBright: AppColorsLight.surfaceBright,
      surfaceContainerLowest: AppColorsLight.surfaceContainerLowest,
      surfaceContainerLow: AppColorsLight.surfaceContainerLow,
      surfaceContainer: AppColorsLight.surfaceContainer,
      surfaceContainerHigh: AppColorsLight.surfaceContainerHigh,
      surfaceContainerHighest: AppColorsLight.surfaceContainerHighest,
      onSurface: AppColorsLight.onSurface,
      onSurfaceVariant: AppColorsLight.onSurfaceVariant,
      //Outline
      outline: AppColorsLight.outline,
      outlineVariant: AppColorsLight.outlineVariant,
      //others
      scrim: AppColors.scrim,
      shadow: AppColors.shadow,
      inversePrimary: AppColorsLight.inversePrimary,
      inverseSurface: AppColorsLight.inverseSurface,
      onInverseSurface: AppColorsLight.inverseOnSurface,
    ),
  );
}
