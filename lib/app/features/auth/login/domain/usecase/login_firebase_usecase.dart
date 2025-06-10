import 'package:car_keeper/app/core/failure/i_app_failure.dart';
import 'package:car_keeper/app/features/auth/login/domain/usecase/i_login_firebase_usecase.dart';
import 'package:car_keeper/app/features/auth/login/infra/repository/i_login_firebase_repository.dart';
import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginFirebaseUsecase implements ILoginFirebaseUsecase {
  final ILoginFirebaseRepository _repository;

  LoginFirebaseUsecase({required ILoginFirebaseRepository repository})
      : _repository = repository;

  @override
  Future<Either<IAppFailure, UserCredential>> call(
      {required String email, required String password}) async {
    return await _repository.call(email: email, password: password);
  }
}
