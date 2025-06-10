import 'package:car_keeper/app/core/failure/i_app_failure.dart';
import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class ICreateUserFirebaseUsecase {
  Future<Either<IAppFailure, UserCredential>> call({
    required String email,
    required String password,
  });
}
