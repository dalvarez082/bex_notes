import 'package:bex_notes/app/bloc/text_input/class_blocs.dart';
import 'package:bex_notes/core/utils/system_ui_utils.dart';
import 'package:bex_notes/widgets/molecules/signup_continue_button.dart';
import 'package:bex_notes/widgets/molecules/signup_form_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemUiUtils.setSystemOverlayStyle(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('Registró')),
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
                  padding: EdgeInsets.symmetric(horizontal: 32.r,vertical: 16.r),
                  child: Column(
                    spacing: 24.r,
                    children: [
                      const SignupFormFields(),
                      Padding(
                        padding:  EdgeInsets.symmetric(vertical: 16.r),
                        child: SignupContinueButton(onPressed: () {}),
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
