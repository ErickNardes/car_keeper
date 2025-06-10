import 'package:car_keeper/app/core/auth/controller/auth_controller.dart';
import 'package:car_keeper/app/core/auth/entity/user_auth_entity.dart';
import 'package:car_keeper/app/core/routes/app_routes.dart';
import 'package:car_keeper/app/core/theme/theme_colors.dart';
import 'package:car_keeper/app/features/auth/login/domain/entities/user_harura_entity.dart';
import 'package:car_keeper/app/features/auth/login/domain/usecase/i_get_user_usecase.dart';
import 'package:car_keeper/app/features/auth/login/domain/usecase/i_login_firebase_usecase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final ILoginFirebaseUsecase _iLoginFirebaseUsecase;
  final IGetUserUsecase _iGetUserUsecase;
  final _authController = Get.find<AuthController>();
  final Rx<bool> isLoading = false.obs;

  //Entity
  UserHaruraEntity? userHaruraEntity;

//Controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  LoginController({
    required IGetUserUsecase iGetUserUsecase,
    required ILoginFirebaseUsecase iLoginFirebaseUsecase,
  })  : _iLoginFirebaseUsecase = iLoginFirebaseUsecase,
        _iGetUserUsecase = iGetUserUsecase;

  Future<void> getUserHasura(String email) async {
    final result = await _iGetUserUsecase.call(email);
    result.fold((l) {
      isLoading.value = false;
    }, (r) {
      userHaruraEntity = r;
    });
  }

  Future<void> login() async {
    isLoading.value = true;
    if (formKey.currentState!.validate()) {
      final result = await _iLoginFirebaseUsecase.call(
        email: emailController.text,
        password: passwordController.text,
      );

      result.fold((l) {
        isLoading.value = false;
        Get.showSnackbar(GetSnackBar(
          backgroundColor: errorColor,
          duration: const Duration(seconds: 3),
          messageText: Text(l.message),
        ));
      }, (r) async {
        if (r.user != null) {
          await getUserHasura(r.user!.email!);

          _authController.setUserAuthEntity(UserAuthEntity(
            id: userHaruraEntity!.id,
            email: userHaruraEntity!.email,
            name: userHaruraEntity!.name,
            userCredential: r,
            cratedAt: userHaruraEntity!.createdAt,
            updatedAt: userHaruraEntity!.updatedAt,
          ));
          Get.toNamed(AppRoutes.home);
        }
      });
    }
    isLoading.value = false;
  }
}
