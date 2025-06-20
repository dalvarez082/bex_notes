import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResponsiveConfig {
  static const Size defaultDesignSize = Size(375, 812);

  static Widget init({
    required Widget Function(BuildContext context) builder,
    Size designSize = defaultDesignSize,
  }) {
    return ScreenUtilInit(
      designSize: designSize,
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      builder: (context, _) => builder(context),
    );
  }
}
