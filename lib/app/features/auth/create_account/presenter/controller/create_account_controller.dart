import 'package:car_keeper/app/core/theme/theme_colors.dart';
import 'package:car_keeper/app/features/auth/create_account/domain/params/create_user_hasura_params.dart';
import 'package:car_keeper/app/features/auth/create_account/domain/usecases/i_create_user_firebase_usecase.dart';
import 'package:car_keeper/app/features/auth/create_account/domain/usecases/i_create_user_hasura_usecase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateAccountController extends GetxController {
  final ICreateUserHasuraUsecase _iCreateUserHasuraUsecase;
  final ICreateUserFirebaseUsecase _iCreateUserFirebaseUsecase;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final Rx<bool> isLoading = false.obs;

  final formKey = GlobalKey<FormState>();

  CreateAccountController({
    required ICreateUserHasuraUsecase iCreateUserHasuraUsecase,
    required ICreateUserFirebaseUsecase iCreateUserFirebaseUsecase,
  })  : _iCreateUserHasuraUsecase = iCreateUserHasuraUsecase,
        _iCreateUserFirebaseUsecase = iCreateUserFirebaseUsecase;

  Future<void> createUserFirebase() async {
    isLoading.value = true;
    if (formKey.currentState!.validate()) {
      final result = await _iCreateUserFirebaseUsecase.call(
        email: emailController.text,
        password: passwordController.text,
      );

      result.fold((l) {
        Get.showSnackbar(GetSnackBar(
          backgroundColor: errorColor,
          duration: const Duration(seconds: 3),
          messageText: Text(l.message),
        ));
      }, (r) async {
        await createAccountUserHasura(r.user!.uid);
      });
    }
    isLoading.value = false;
  }

  Future<void> createAccountUserHasura(String firebaseUid) async {
    final params = CreateUserHasuraParams(
      email: emailController.text,
      name: nameController.text,
      firebaseUid: firebaseUid,
    );

    final result = await _iCreateUserHasuraUsecase.call(params);
    result.fold((l) => l, (r) {
      Get.back();
      Get.showSnackbar(const GetSnackBar(
        duration: Duration(seconds: 3),
        backgroundColor: successColor,
        messageText: Text(
          'Create Account Success!',
          style: TextStyle(color: white),
        ),
      ));
    });
  }
}
