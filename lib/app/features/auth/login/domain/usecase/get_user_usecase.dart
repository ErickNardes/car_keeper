import 'package:car_keeper/app/core/failure/i_app_failure.dart';
import 'package:car_keeper/app/features/auth/login/domain/entities/user_harura_entity.dart';
import 'package:car_keeper/app/features/auth/login/domain/usecase/i_get_user_usecase.dart';
import 'package:car_keeper/app/features/auth/login/infra/repository/i_get_user_repository.dart';
import 'package:either_dart/either.dart';

class GetUserUsecase implements IGetUserUsecase {
  final IGetUserRepository _repository;

  GetUserUsecase({required IGetUserRepository repository})
      : _repository = repository;

  @override
  Future<Either<IAppFailure, UserHaruraEntity>> call(String email) async {
    return await _repository.call(email);
  }
}
