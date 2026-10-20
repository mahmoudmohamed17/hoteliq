import 'package:flutter/material.dart';

import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/validators.dart';
import '../../../../core/widgets/custom_password_form_field.dart';
import '../../../../core/widgets/custom_text_form_field.dart';

class LoginForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const new({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 16,
        children: [
          CustomTextFormField(
            controller: emailController,
            hint: AppStrings.emailHint,
            label: AppStrings.emailLabel,
            prefixIcon: const Icon(Icons.email_outlined),
            textInputAction: TextInputAction.next,
            validator: Validators.validateEmail,
          ),
          CustomPasswordFormField(
            controller: passwordController,
            hint: AppStrings.passwordHint,
            label: AppStrings.passwordLabel,
            validator: Validators.validatePassword,
          ),
        ],
      ),
    );
  }
}
