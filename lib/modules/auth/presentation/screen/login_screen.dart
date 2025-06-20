import 'package:bex_notes/app/bloc/text_input/class_blocs.dart';
import 'package:bex_notes/app/routes/app_routes_names.dart';
import 'package:bex_notes/core/utils/system_ui_utils.dart';
import 'package:bex_notes/styles/typography/app_responsive_text_extension.dart';
import 'package:bex_notes/widgets/atoms/button_text.dart';
import 'package:bex_notes/widgets/molecules/login_continue_button.dart';
import 'package:bex_notes/widgets/molecules/login_form_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemUiUtils.setSystemOverlayStyle(context);

    return SafeArea(
      child: Scaffold(
        body: MultiBlocProvider(
          providers: [
            BlocProvider<EmailBloc>(create: (_) => EmailBloc()),
            BlocProvider<PasswordBloc>(create: (_) => PasswordBloc()),
          ],
          child: Column(
            children: [
              Image.asset('assets/images/register_image.webp'),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.r),
                  child: Column(
                    spacing: 24.r,
                    children: [
                      Padding(
                        padding:  EdgeInsets.symmetric(vertical: 24.r),
                        child: Text(
                          'Inicia sesión',
                          style: context.textresponsive.displaySmall,
                        ),
                      ),
                      const LoginFormFields(),
                      Padding(
                        padding:  EdgeInsets.symmetric(vertical: 16.r),
                        child: LoginContinueButton(onPressed: () {}),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 24.r),
                child: ButtonText(onPressed: () {
                  context.push(AppRoutesNames.signupScreen);
                }, text: 'Crear una cuenta'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
