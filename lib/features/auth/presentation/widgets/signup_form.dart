import 'package:flutter/material.dart';

import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/validators.dart';
import '../../../../core/widgets/custom_password_form_field.dart';
import '../../../../core/widgets/custom_text_form_field.dart';

class SignupForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  const new({
    super.key,
    required this.formKey,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
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
            controller: nameController,
            hint: AppStrings.fullNameHint,
            label: AppStrings.fullNameLabel,
            prefixIcon: const Icon(Icons.person_outline),
            textInputAction: TextInputAction.next,
            validator: Validators.validateName,
          ),
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
          CustomPasswordFormField(
            controller: confirmPasswordController,
            hint: AppStrings.confirmPasswordHint,
            label: AppStrings.confirmPasswordLabel,
            validator: (value) => Validators.validateConfirmPassword(
              passwordController.text,
              value,
            ),
          ),
        ],
      ),
    );
  }
}
