import 'package:bex_notes/app/global_bloc/text_input/class_blocs.dart';
import 'package:bex_notes/app/routes/app_routes_names.dart';
import 'package:bex_notes/core/utils/hash_utils.dart';
import 'package:bex_notes/core/utils/system_ui_utils.dart';
import 'package:bex_notes/modules/auth/data/datasources/user_local_datasource.dart';
import 'package:bex_notes/modules/auth/data/repositories/user_repository_impl.dart';
import 'package:bex_notes/modules/auth/domain/entities/user.dart';
import 'package:bex_notes/modules/auth/domain/usecases/register_user.dart';
import 'package:bex_notes/modules/auth/presentation/widget/signup_continue_button.dart';
import 'package:bex_notes/modules/auth/presentation/widget/signup_form_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemUiUtils.setSystemOverlayStyle(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('Registro')),
        body: MultiBlocProvider(
          providers: [
            BlocProvider<UsernameBloc>(create: (_) => UsernameBloc()),
            BlocProvider<EmailBloc>(create: (_) => EmailBloc()),
            BlocProvider<PasswordBloc>(create: (_) => PasswordBloc()),
          ],
          child: Column(
            children: [
              Image.asset('assets/images/signup.webp'),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.r, vertical: 16.r),
                  child: Column(
                    children: [
                      const SignupFormFields(),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.r),
                        child: Builder(
                          builder: (context) {
                            return SignupContinueButton(
                              onPressed: () async {
                                final name = context.read<UsernameBloc>().state.text;
                                final email = context.read<EmailBloc>().state.text;
                                final password = context.read<PasswordBloc>().state.text;
                                final hashedPassword = hashPassword(password);

                                final user = User(
                                  name: name,
                                  email: email,
                                  password: hashedPassword,
                                  createdAt: DateTime.now(),
                                );

                                final localDataSource = UserLocalDataSource();
                                final repository = UserRepositoryImpl(localDataSource);
                                final registerUser = RegisterUser(repository);

                                try {
                                  await registerUser(user);
                                  if (context.mounted) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Usuario registrado correctamente'),
                                      ),
                                    );
                                    context.go(AppRoutesNames.loginScreen);
                                  }
                                } catch (e) {
                                  if (context.mounted) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text('Error: $e')),
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
            ],
          ),
        ),
      ),
    );
  }
}
