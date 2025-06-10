import 'package:car_keeper/app/core/failure/i_app_failure.dart';
import 'package:car_keeper/app/features/auth/login/domain/entities/user_harura_entity.dart';
import 'package:either_dart/either.dart';

abstract class IGetUserRepository {
  Future<Either<IAppFailure, UserHaruraEntity>> call(String email);
}
