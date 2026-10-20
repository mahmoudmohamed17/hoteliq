import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routing/app_routes.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/widgets/custom_elevated_button.dart';
import '../../../../core/widgets/custom_outlined_button.dart';
import '../../../../core/widgets/custom_password_form_field.dart';
import '../../../../core/widgets/custom_text_button.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../core/utils/validators.dart';
import '../widgets/auth_footer.dart';
import '../widgets/auth_header.dart';

class LoginScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  void _validate() {
    if (_formKey.currentState?.validate() ?? false) {}
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
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
              title: AppStrings.loginTitle,
              subTitle: AppStrings.loginSubtitle,
            ),
            20.verticalSpace,
            _form(),
            4.verticalSpace,
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: CustomTextButton(
                text: AppStrings.forgotPassword,
                onPressed: () {},
                fontWeight: FontWeight.w600,
                fontColor: context.colorScheme.primary,
              ),
            ),
            16.verticalSpace,
            CustomElevatedButton(
              text: AppStrings.loginButton,
              onPressed: _validate,
            ),
            12.verticalSpace,
            CustomOutlinedButton(
              text: AppStrings.loginWithGoogle,
              onPressed: () {},
              icon: Image.asset(
                AppIcons.google,
                height: 20.h,
                width: 20.w,
              ),
            ),
            34.verticalSpace,
            AuthFooter(
              question: AppStrings.noAccountYet,
              actionText: AppStrings.signupButton,
              onActionTap: () => context.push(AppRoutes.signup),
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
        ],
      ),
    );
  }
}
