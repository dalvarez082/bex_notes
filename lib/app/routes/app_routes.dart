

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static GoRouter getRouter() {
    return GoRouter(
      initialLocation: '/login',
      routes: [
        GoRoute(
          path: '/login',
          builder: (context, state) =>  Container(
            color: Colors.amber,
          ), 
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