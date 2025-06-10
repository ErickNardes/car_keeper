import 'package:car_keeper/app/core/hasura/i_hasura_service.dart';
import 'package:car_keeper/app/features/auth/create_account/domain/repositories/create_user_firebase_repository.dart';
import 'package:car_keeper/app/features/auth/create_account/domain/repositories/create_user_hasura_repository.dart';
import 'package:car_keeper/app/features/auth/create_account/domain/usecases/create_user_firebase_usecase.dart';
import 'package:car_keeper/app/features/auth/create_account/domain/usecases/create_user_hsura_usecase.dart';
import 'package:car_keeper/app/features/auth/create_account/domain/usecases/i_create_user_firebase_usecase.dart';
import 'package:car_keeper/app/features/auth/create_account/domain/usecases/i_create_user_hasura_usecase.dart';
import 'package:car_keeper/app/features/auth/create_account/external/datasource/create_user_firebase_datasource.dart';
import 'package:car_keeper/app/features/auth/create_account/external/datasource/create_user_hasura_datasource.dart';
import 'package:car_keeper/app/features/auth/create_account/infra/datasource/i_create_user_firebase_datasource.dart';
import 'package:car_keeper/app/features/auth/create_account/infra/datasource/i_create_user_hasura_datasource.dart';
import 'package:car_keeper/app/features/auth/create_account/infra/repository/i_create_user_firebase_repository.dart';
import 'package:car_keeper/app/features/auth/create_account/infra/repository/i_create_user_hasura_repository.dart';
import 'package:car_keeper/app/features/auth/create_account/presenter/controller/create_account_controller.dart';
import 'package:get/get.dart';

class CreateAccountControllerBindings extends Bindings {
  @override
  void dependencies() {
    Get.find<IHasuraService>();

    //Firebase User
    Get.lazyPut<ICreateUserFirebaseDatasource>(
        () => CreateUserFirebaseDatasource());
    Get.lazyPut<ICreateUserFirebaseRepository>(() =>
        CreateUserFirebaseRepository(
            datasource: Get.find<ICreateUserFirebaseDatasource>()));
    Get.lazyPut<ICreateUserFirebaseUsecase>(() => CreateUserFirebaseUsecase(
        repository: Get.find<ICreateUserFirebaseRepository>()));

    //Hasura user
    Get.lazyPut<ICreateUserHasuraDatasource>(() =>
        CreateUserHasuraDatasource(iHasuraService: Get.find<IHasuraService>()));
    Get.lazyPut<ICreateUserHasuraRepository>(() => CreateUserHasuraRepository(
        iCreateUserHasuraDatasource: Get.find<ICreateUserHasuraDatasource>()));
    Get.lazyPut<ICreateUserHasuraUsecase>(() => CreateUserHsuraUsecase(
        repository: Get.find<ICreateUserHasuraRepository>()));

    Get.lazyPut<CreateAccountController>(() => CreateAccountController(
          iCreateUserHasuraUsecase: Get.find<ICreateUserHasuraUsecase>(),
          iCreateUserFirebaseUsecase: Get.find<ICreateUserFirebaseUsecase>(),
        ));
  }
}
