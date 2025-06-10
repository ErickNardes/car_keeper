import 'package:car_keeper/app/core/failure/i_app_failure.dart';
import 'package:car_keeper/app/features/auth/create_account/domain/usecases/i_create_user_firebase_usecase.dart';
import 'package:car_keeper/app/features/auth/create_account/infra/repository/i_create_user_firebase_repository.dart';
import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CreateUserFirebaseUsecase implements ICreateUserFirebaseUsecase {
  final ICreateUserFirebaseRepository _repository;

  CreateUserFirebaseUsecase({required ICreateUserFirebaseRepository repository})
      : _repository = repository;

  @override
  Future<Either<IAppFailure, UserCredential>> call({
    required String email,
    required String password,
  }) async {
    return await _repository.call(
      email: email,
      password: password,
    );
  }
}
