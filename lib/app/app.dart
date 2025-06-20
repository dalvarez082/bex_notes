import 'package:bex_notes/app/routes/app_routes.dart';
import 'package:bex_notes/core/config/responsive_config.dart';
import 'package:bex_notes/styles/theme/app_theme.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveConfig.init(
        builder: (context) => MaterialApp.router(
              debugShowCheckedModeBanner: false,
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              themeMode: ThemeMode.system,            
             
              routerConfig: AppRouter.getRouter(),
            ));
  }
}