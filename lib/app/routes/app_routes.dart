
import 'package:bex_notes/app/routes/app_routes_names.dart';
import 'package:bex_notes/modules/auth/presentation/screen/auth_gate_screen.dart';
import 'package:bex_notes/modules/auth/presentation/screen/login_screen.dart';
import 'package:bex_notes/modules/auth/presentation/screen/signup_screen.dart';
import 'package:bex_notes/modules/notes/presentation/screen/home_screem.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static GoRouter getRouter() {
    return GoRouter(
      initialLocation: AppRoutesNames.authGate,
      routes: [
        GoRoute(
      path: AppRoutesNames.authGate,
      builder: (context, state) => const AuthGateScreen(),
    ),
        GoRoute(
          path: AppRoutesNames.loginScreen,
          builder: (context, state) =>   LoginScreen()
        ),
        GoRoute(
          path: AppRoutesNames.signupScreen,
          builder: (context, state) =>   SignupScreen()
        ),
        GoRoute(
          path: AppRoutesNames.homeScreen,
          builder: (context, state) =>  HomeScreem()
        ),
      ],
    );
  }
  
 
}