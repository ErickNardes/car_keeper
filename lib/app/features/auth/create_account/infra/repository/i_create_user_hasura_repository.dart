import 'package:car_keeper/app/core/failure/i_app_failure.dart';
import 'package:car_keeper/app/features/auth/create_account/domain/entities/create_user_hasura_entity.dart';
import 'package:car_keeper/app/features/auth/create_account/domain/params/create_user_hasura_params.dart';
import 'package:either_dart/either.dart';

abstract class ICreateUserHasuraRepository {
  Future<Either<IAppFailure, CreateUserHasuraEntity>> call(
      CreateUserHasuraParams params);
}
