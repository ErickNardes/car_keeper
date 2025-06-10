import 'package:car_keeper/app/features/auth/login/domain/entities/user_harura_entity.dart';

abstract class IGetUserDatasource {
  Future<UserHaruraEntity> call(String email);
}
