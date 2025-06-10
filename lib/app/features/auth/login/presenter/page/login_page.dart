import 'package:car_keeper/app/core/routes/app_routes.dart';
import 'package:car_keeper/app/core/theme/theme_colors.dart';
import 'package:car_keeper/app/core/widgets/custom_text_form_field.dart';
import 'package:car_keeper/app/core/widgets/primary_button.dart';
import 'package:car_keeper/app/features/auth/login/presenter/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: controller.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'CarKeeper',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                ),
                const SizedBox(
                  height: 12,
                ),
                CustomTextFormFieldWidget(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Required field';
                    }
                    return null;
                  },
                  hintText: 'Email',
                  prefixIcon: const Icon(Icons.email_outlined),
                  controller: controller.emailController,
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(
                  height: 12,
                ),
                CustomTextFormFieldWidget(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Required field';
                    }
                    return null;
                  },
                  prefixIcon: const Icon(Icons.lock_outline),
                  hintText: 'Password',
                  controller: controller.passwordController,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 12,
                ),
                Obx(
                  () => PrimaryButtonWidget(
                    title: 'Log In',
                    isLoading: controller.isLoading.value.obs,
                    onPressed: () {
                      controller.login();
                    },
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('''Don't have an account?'''),
                    TextButton(
                        onPressed: () {
                          Get.toNamed(AppRoutes.createAccountPage);
                        },
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(color: primaryColor),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
