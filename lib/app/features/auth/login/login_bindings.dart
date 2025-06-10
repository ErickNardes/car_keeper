import 'package:car_keeper/app/core/hasura/i_hasura_service.dart';
import 'package:car_keeper/app/features/auth/login/domain/repository/get_user_repository.dart';
import 'package:car_keeper/app/features/auth/login/domain/repository/login_firebase_repository.dart';
import 'package:car_keeper/app/features/auth/login/domain/usecase/get_user_usecase.dart';
import 'package:car_keeper/app/features/auth/login/domain/usecase/i_get_user_usecase.dart';
import 'package:car_keeper/app/features/auth/login/domain/usecase/i_login_firebase_usecase.dart';
import 'package:car_keeper/app/features/auth/login/domain/usecase/login_firebase_usecase.dart';
import 'package:car_keeper/app/features/auth/login/external/datasource/get_user_datasource.dart';
import 'package:car_keeper/app/features/auth/login/external/datasource/login_firebase_datasource.dart';
import 'package:car_keeper/app/features/auth/login/infra/datasource/I_login_firebase_datasource.dart';
import 'package:car_keeper/app/features/auth/login/infra/datasource/i_get_user_datasource.dart';
import 'package:car_keeper/app/features/auth/login/infra/repository/i_get_user_repository.dart';
import 'package:car_keeper/app/features/auth/login/infra/repository/i_login_firebase_repository.dart';
import 'package:car_keeper/app/features/auth/login/presenter/controller/login_controller.dart';
import 'package:get/get.dart';

class LoginBindings extends Bindings {
  @override
  void dependencies() {
    //Get Users hasura
    Get.lazyPut<IGetUserDatasource>(
        () => GetUserDatasource(iHasuraService: Get.find<IHasuraService>()));
    Get.lazyPut<IGetUserRepository>(
        () => GetUserRepository(datasource: Get.find<IGetUserDatasource>()));
    Get.lazyPut<IGetUserUsecase>(
        () => GetUserUsecase(repository: Get.find<IGetUserRepository>()));

    //Login Firebase
    Get.lazyPut<ILoginFirebaseDatasource>(() => LoginFirebaseDatasource());
    Get.lazyPut<ILoginFirebaseRepository>(() => LoginFirebaseRepository(
        datasource: Get.find<ILoginFirebaseDatasource>()));
    Get.lazyPut<ILoginFirebaseUsecase>(() =>
        LoginFirebaseUsecase(repository: Get.find<ILoginFirebaseRepository>()));

    Get.lazyPut<LoginController>(
      () => LoginController(
          iLoginFirebaseUsecase: Get.find<ILoginFirebaseUsecase>(),
          iGetUserUsecase: Get.find<IGetUserUsecase>()),
    );
  }
}
