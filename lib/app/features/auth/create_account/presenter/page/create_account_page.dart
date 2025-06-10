import 'package:car_keeper/app/core/widgets/custom_text_form_field.dart';
import 'package:car_keeper/app/core/widgets/primary_button.dart';
import 'package:car_keeper/app/features/auth/create_account/presenter/controller/create_account_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateAccountPage extends GetView<CreateAccountController> {
  const CreateAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: controller.formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Create Account',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomTextFormFieldWidget(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Required field';
                    }
                    return null;
                  },
                  hintText: 'Name',
                  controller: controller.nameController,
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
                  hintText: 'Email',
                  controller: controller.emailController,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 12,
                ),
                CustomTextFormFieldWidget(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Required field';
                    } else if (value.length < 6) {
                      return 'Insert Password than 6 digits';
                    }
                    return null;
                  },
                  hintText: 'Password',
                  controller: controller.passwordController,
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(
                  height: 12,
                ),
                CustomTextFormFieldWidget(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Required field';
                    } else if (value != controller.passwordController.text) {
                      return 'Password not equals';
                    }
                    return null;
                  },
                  hintText: 'Confirm Password',
                  controller: controller.confirmPasswordController,
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(
                  height: 12,
                ),
                Obx(() => PrimaryButtonWidget(
                      title: 'Create Account',
                      isLoading: controller.isLoading.value.obs,
                      onPressed: () {
                        controller.createUserFirebase();
                      },
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
