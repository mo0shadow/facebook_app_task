import 'package:facebook_task_solution/core/app_theme.dart';
import 'package:facebook_task_solution/pages/home_page.dart';
import 'package:facebook_task_solution/widgets/login/custom_elevated_button.dart';
import 'package:facebook_task_solution/widgets/login/custom_text_form_field.dart';
import 'package:flutter/cupertino.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomTextFormField(
            validator: (text) {
              // Regex pattern for email validation
              final RegExp emailRegExp =
                  RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

              if (text != null && text.trim().isEmpty) {
                return 'Email is required';
              }
              if (text != null && !emailRegExp.hasMatch(text)) {
                return 'Please enter a valid email address';
              }

              return null;
            },
            controller: emailController,
            hintText: 'Email address',
          ),
          SizedBox(height: size.height * .03),
          CustomTextFormField(
            validator: (text) {
              if (text != null && text.trim().isEmpty) {
                return 'Password is required';
              }

              return null;
            },
            controller: passwordController,
            hintText: 'Password',
            isPasswordField: true,
          ),
          SizedBox(height: size.height * .03),
          CustomElevatedButton(
            text: 'Login',
            textColor: AppTheme.white,
            onPressed: _clickOnLogin,
          ),
          const SizedBox(height: 16),
          GestureDetector(
            onTap: () {},
            child: const Text(
              "Forgot password?",
              textAlign: TextAlign.center,
              style: TextStyle(color: AppTheme.grey),
            ),
          ),
        ],
      ),
    );
  }

  _clickOnLogin() {
    if (!formKey.currentState!.validate()) {
      return;
    }
    Navigator.pushReplacementNamed(context, HomePage.routeName);
  }
}
