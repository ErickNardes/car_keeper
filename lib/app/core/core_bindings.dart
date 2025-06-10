import 'package:car_keeper/app/core/auth/controller/auth_controller.dart';
import 'package:car_keeper/app/core/hasura/hasura_service.dart';
import 'package:car_keeper/app/core/hasura/i_hasura_service.dart';
import 'package:car_keeper/app/features/auth/login/login_bindings.dart';
import 'package:get/get.dart';

class CoreBindings extends Bindings {
  @override
  void dependencies() {
    LoginBindings().dependencies();
    Get.put<IHasuraService>(HasuraService());
    Get.put<AuthController>(AuthController());
  }
}
