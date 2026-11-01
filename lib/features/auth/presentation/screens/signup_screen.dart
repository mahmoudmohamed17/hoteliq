import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/custom_elevated_button.dart';
import '../../../../core/widgets/custom_outlined_button.dart';
import '../widgets/auth_footer.dart';
import '../widgets/auth_header.dart';
import '../widgets/or_widget.dart';
import '../widgets/signup_form.dart';

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
            SignupForm(
              formKey: _formKey,
              nameController: _nameController,
              emailController: _emailController,
              passwordController: _passwordController,
              confirmPasswordController: _confirmPasswordController,
            ),
            24.verticalSpace,
            CustomElevatedButton(
              text: AppStrings.signupButton,
              onPressed: _validate,
            ),
            24.verticalSpace,
            const OrWidget(),
            24.verticalSpace,
            CustomOutlinedButton(
              text: AppStrings.loginWithGoogle,
              onPressed: () {},
              icon: Image.asset(
                AppIcons.google,
                height: 20.h,
                width: 20.w,
              ),
            ),
            36.verticalSpace,
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
}
