import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:training/core/extensions/build_context_ext.dart';
import 'package:training/presentation/home/pages/main_page.dart';

import '../../../core/assets/assets.gen.dart';
import '../../../core/components/custom_button.dart';
import '../../../core/components/custom_sized_box.dart';
import '../../../core/components/custom_text_field.dart';
import '../../../core/constants/colors.dart';
import '../../home/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  bool isShowPassword = true;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SpaceHeight(100),
              Image.asset(
                Assets.images.logo.path,
                width: 400,
                height: 100,
              ),
              const SpaceHeight(80),
              CustomTextField(
                controller: emailController,
                label: 'Email Address',
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    Assets.icons.email.path,
                    height: 20,
                    width: 20,
                  ),
                ),
              ),
              const SpaceHeight(20),
              CustomTextField(
                controller: passwordController,
                label: 'Password',
                obscureText: isShowPassword,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    Assets.icons.password.path,
                    height: 20,
                    width: 20,
                  ),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    isShowPassword ? Icons.visibility_off : Icons.visibility,
                    color: AppColors.black[200],
                  ),
                  onPressed: () {
                    setState(() {
                      isShowPassword = !isShowPassword;
                    });
                  },
                ),
              ),
              const SpaceHeight(90),
              CustomButton.filled(
                label: 'Login',
                onPressed: () {
                  context.pushReplacement(const MainPage());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
