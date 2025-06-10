import 'package:car_keeper/app/core/failure/i_app_failure.dart';
import 'package:car_keeper/app/features/auth/create_account/domain/entities/create_user_hasura_entity.dart';
import 'package:car_keeper/app/features/auth/create_account/domain/params/create_user_hasura_params.dart';
import 'package:car_keeper/app/features/auth/create_account/infra/datasource/i_create_user_hasura_datasource.dart';
import 'package:car_keeper/app/features/auth/create_account/infra/repository/i_create_user_hasura_repository.dart';
import 'package:either_dart/either.dart';

class CreateUserHasuraRepository implements ICreateUserHasuraRepository {
  final ICreateUserHasuraDatasource _iCreateUserHasuraDatasource;

  CreateUserHasuraRepository(
      {required ICreateUserHasuraDatasource iCreateUserHasuraDatasource})
      : _iCreateUserHasuraDatasource = iCreateUserHasuraDatasource;
  @override
  Future<Either<IAppFailure, CreateUserHasuraEntity>> call(
      CreateUserHasuraParams params) async {
    try {
      final result = await _iCreateUserHasuraDatasource.call(params);
      return Right(result);
    } on IAppFailure catch (e) {
      return Left(e);
    }
  }
}
