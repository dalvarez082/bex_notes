import 'package:auto_size_text/auto_size_text.dart';
import 'package:bex_notes/styles/typography/app_responsive_text_styles.dart';
import 'package:bex_notes/styles/typography/app_responsive_text_styles_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonText extends StatelessWidget {
  final String? text;
  final double? height;
  final VoidCallback onPressed;
  final bool enabled;
  final bool secondary;

  const ButtonText(
      {super.key,
      this.text,
      this.height,
      required this.onPressed,
      this.enabled = true,
      this.secondary = false});

  @override
  Widget build(BuildContext context) {
    const textStyles = AppResponsiveTextStyles();
    final textStyles2 = AppResponsiveTextStylesContext(context);
    return SizedBox(
      height: height ?? 32.r,
      child: TextButton(
          onPressed: enabled ? onPressed : null,
          child: AutoSizeText(
            text ?? '',
            style: secondary
                ? textStyles2.titleLargeVariant2
                : textStyles.titleLarge,
            maxLines: 1,
            stepGranularity: 0.1,
            minFontSize: 0.1,
          )),
    );
  }
}
