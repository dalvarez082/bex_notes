import 'package:bex_notes/core/services/session_service.dart';
import 'package:bex_notes/global_widgets/atoms/button_filled.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:bex_notes/app/routes/app_routes_names.dart';

class UserSessionModal extends StatelessWidget {
  final String? userName;
  final String? token;

  const UserSessionModal({
    super.key,
    required this.userName,
    required this.token,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.r, vertical: 42.r),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.account_circle, size: 48),
              SizedBox(height: 12.r),
              Text(
                userName ?? 'Nombre no disponible',
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.r),
              Text(
                'Token de sesión:',
                style: TextStyle(fontSize: 14.sp, color: Colors.grey),
              ),
              SizedBox(height: 4.r),
              SelectableText(
                token ?? 'Token no disponible',
                style: TextStyle(fontSize: 13.sp),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.r),
              ButtonFilled(
              
                onPressed: () async {
                  await SessionService.clearSession();
                  if (context.mounted) {
                    Navigator.of(context).pop();
                    context.go(AppRoutesNames.loginScreen);
                  }
                },
                icon: const Icon(Icons.logout),
                text: 'Cerrar sesión',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
