import 'package:bex_notes/app/routes/app_routes_names.dart';
import 'package:bex_notes/core/services/session_service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AuthGateScreen extends StatelessWidget {
  const AuthGateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: SessionService.getToken(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        final token = snapshot.data;

        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (token != null && token.isNotEmpty) {
            context.go(AppRoutesNames.homeScreen);
          } else {
            context.go(AppRoutesNames.loginScreen);
          }
        });

        return const SizedBox.shrink();
      },
    );
  }
}
