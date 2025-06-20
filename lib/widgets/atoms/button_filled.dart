import 'package:auto_size_text/auto_size_text.dart';
import 'package:bex_notes/styles/typography/app_responsive_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonFilled extends StatelessWidget {
  final Widget? icon;
  final Color? iconColor;
  final String? text;
  final double? height;
  final double width;
  final VoidCallback onPressed;
  final bool enabled;

  const ButtonFilled({
    super.key,
    this.icon,
    this.iconColor,
    this.text,
    this.height,
    this.width = double.infinity,
    required this.onPressed,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final double resolvedHeight = height ?? 32.r;
    const textStyles = AppResponsiveTextStyles();

    return SizedBox(
      height: resolvedHeight,
      width: width,
      child: FilledButton(
        onPressed: enabled ? onPressed : null,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 24.r,
              child: icon != null ? icon! : const SizedBox.shrink(),
            ),
            Expanded(
              child: AutoSizeText(
                maxLines: 1,
                text ?? '',
                textAlign: TextAlign.center,
                style: textStyles.titleSmall,
                stepGranularity: 0.1,
                minFontSize: 0.1,
              ),
            ),
            SizedBox(
              width: 24.r,
            )
          ],
        ),
      ),
    );
  }
}
