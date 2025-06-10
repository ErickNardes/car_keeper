import 'package:car_keeper/app/core/auth/entity/user_auth_entity.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  UserAuthEntity? userAuthEntity;

  void setUserAuthEntity(UserAuthEntity user) {
    userAuthEntity = user;
  }
}
