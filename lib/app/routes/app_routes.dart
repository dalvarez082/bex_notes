

import 'package:bex_notes/app/routes/app_routes_names.dart';
import 'package:bex_notes/modules/auth/presentation/screen/login_screen.dart';
import 'package:bex_notes/modules/auth/presentation/screen/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static GoRouter getRouter() {
    return GoRouter(
      initialLocation: AppRoutesNames.loginScreen,
      routes: [
        GoRoute(
          path: AppRoutesNames.loginScreen,
          builder: (context, state) =>   LoginScreen()
        ),
        GoRoute(
          path: AppRoutesNames.signupScreen,
          builder: (context, state) =>   SignupScreen()
        ),
        GoRoute(
          path: '/home',
          builder: (context, state) =>  Container(
            color: Colors.blue,
          ), 
        ),
      ],
    );
  }
  
 
}