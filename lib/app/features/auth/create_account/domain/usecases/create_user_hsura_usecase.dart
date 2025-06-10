import 'package:car_keeper/app/core/failure/i_app_failure.dart';
import 'package:car_keeper/app/features/auth/create_account/domain/entities/create_user_hasura_entity.dart';
import 'package:car_keeper/app/features/auth/create_account/domain/params/create_user_hasura_params.dart';
import 'package:car_keeper/app/features/auth/create_account/domain/usecases/i_create_user_hasura_usecase.dart';
import 'package:car_keeper/app/features/auth/create_account/infra/repository/i_create_user_hasura_repository.dart';
import 'package:either_dart/either.dart';

class CreateUserHsuraUsecase implements ICreateUserHasuraUsecase {
  final ICreateUserHasuraRepository _repository;

  CreateUserHsuraUsecase({required ICreateUserHasuraRepository repository})
      : _repository = repository;

  @override
  Future<Either<IAppFailure, CreateUserHasuraEntity>> call(
      CreateUserHasuraParams params) async {
    return await _repository.call(params);
  }
}
