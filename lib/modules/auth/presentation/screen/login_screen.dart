import 'package:bex_notes/app/global_bloc/text_input/class_blocs.dart';
import 'package:bex_notes/app/routes/app_routes_names.dart';
import 'package:bex_notes/core/services/session_service.dart';
import 'package:bex_notes/core/utils/system_ui_utils.dart';
import 'package:bex_notes/core/utils/token_utils.dart';
import 'package:bex_notes/modules/auth/data/datasources/user_local_datasource.dart';
import 'package:bex_notes/modules/auth/data/repositories/user_repository_impl.dart';
import 'package:bex_notes/modules/auth/domain/usecases/login_user.dart';
import 'package:bex_notes/styles/typography/app_responsive_text_extension.dart';
import 'package:bex_notes/global_widgets/atoms/button_text.dart';
import 'package:bex_notes/modules/auth/presentation/widget/login_continue_button.dart';
import 'package:bex_notes/modules/auth/presentation/widget/login_form_fields.dart';
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
                        padding: EdgeInsets.symmetric(vertical: 24.r),
                        child: Text(
                          'Inicia sesión',
                          style: context.textresponsive.displaySmall,
                        ),
                      ),
                      const LoginFormFields(),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.r),
                        child: Builder(
                          builder: (context) {
                            return LoginContinueButton(
                              onPressed: () async {
                                final email =
                                    context.read<EmailBloc>().state.text;
                                final password =
                                    context.read<PasswordBloc>().state.text;

                                final localDataSource = UserLocalDataSource();
                                final repository = UserRepositoryImpl(
                                  localDataSource,
                                );
                                final loginUser = LoginUser(repository);

                                try {
                                  final user = await loginUser(email, password);
                                  final token = generateToken(24);
                                  await SessionService.saveToken(token);
                                  await SessionService.saveUserId(user.id!);

                                  if (context.mounted) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Bienvenido, ${user.name}',
                                        ),
                                      ),
                                    );
                                    context.go(AppRoutesNames.homeScreen);
                                  }
                                } catch (e) {
                                  if (context.mounted) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text('Error: ${e.toString()}'),
                                      ),
                                    );
                                  }
                                }
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 24.r),
                child: ButtonText(
                  onPressed: () {
                    context.push(AppRoutesNames.signupScreen);
                  },
                  text: 'Crear una cuenta',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
