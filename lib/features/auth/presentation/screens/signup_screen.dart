import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/custom_elevated_button.dart';
import '../../../../core/widgets/custom_password_form_field.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../core/utils/validators.dart';
import '../widgets/auth_footer.dart';
import '../widgets/auth_header.dart';

class SignupScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPasswordController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  void _validate() {
    if (_formKey.currentState?.validate() ?? false) {}
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          children: [
            24.verticalSpace,
            const AuthHeader(
              title: AppStrings.signupTitle,
              subTitle: AppStrings.signupSubtitle,
            ),
            20.verticalSpace,
            _form(),
            24.verticalSpace,
            CustomElevatedButton(
              text: AppStrings.signupButton,
              onPressed: _validate,
            ),
            34.verticalSpace,
            AuthFooter(
              question: AppStrings.haveAccountAlready,
              actionText: AppStrings.loginButton,
              onActionTap: () => context.pop(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _form() {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 16,
        children: [
          CustomTextFormField(
            controller: _nameController,
            hint: AppStrings.fullNameHint,
            label: AppStrings.fullNameLabel,
            prefixIcon: const Icon(Icons.person_outline),
            textInputAction: TextInputAction.next,
            validator: Validators.validateName,
          ),
          CustomTextFormField(
            controller: _emailController,
            hint: AppStrings.emailHint,
            label: AppStrings.emailLabel,
            prefixIcon: const Icon(Icons.email_outlined),
            textInputAction: TextInputAction.next,
            validator: Validators.validateEmail,
          ),
          CustomPasswordFormField(
            controller: _passwordController,
            hint: AppStrings.passwordHint,
            label: AppStrings.passwordLabel,
            validator: Validators.validatePassword,
          ),
          CustomPasswordFormField(
            controller: _confirmPasswordController,
            hint: AppStrings.confirmPasswordHint,
            label: AppStrings.confirmPasswordLabel,
            validator: (value) => Validators.validateConfirmPassword(
              _passwordController.text,
              value,
            ),
          ),
        ],
      ),
    );
  }
}
