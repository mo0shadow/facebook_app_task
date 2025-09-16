import 'package:facebook_task_solution/core/app_assets.dart';
import 'package:facebook_task_solution/core/app_theme.dart';
import 'package:facebook_task_solution/widgets/login/custom_elevated_button.dart';
import 'package:facebook_task_solution/widgets/login/custom_text_form_field.dart';
import 'package:facebook_task_solution/widgets/login/login_form.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  static const routeName = '/login';

  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Todo: use extensions on context
    var size = MediaQuery.of(context).size;

    return Scaffold(
      /*
      to adjust screen (resize) when the device's keyboard appear
      true: resize to ensure that content is not obsecured by the keyboard
      false: not resize
       */
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            /*
            crossStretch to stretch elevatedButton
             */
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                AppAssets.logo,
                height: size.height * 0.10,
              ),
              SizedBox(height: size.height * 0.10),
              const Expanded(
                child: SingleChildScrollView(
                  child: LoginForm(),
                ),
              ),
              CustomElevatedButton(
                text: 'Create Account',
                textColor: AppTheme.primary,
                backgroundColor: AppTheme.white,
                onPressed: () {},
              ),
              SizedBox(height: size.height * 0.10),
              Image.asset(AppAssets.metaImage, height: size.height * 0.05),
            ],
          ),
        ),
      ),
    );
  }
}
