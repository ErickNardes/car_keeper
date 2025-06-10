import 'package:car_keeper/app/core/failure/app_failure.dart';
import 'package:car_keeper/app/core/failure/i_app_failure.dart';
import 'package:car_keeper/app/features/auth/create_account/infra/datasource/i_create_user_firebase_datasource.dart';
import 'package:car_keeper/app/features/auth/create_account/infra/repository/i_create_user_firebase_repository.dart';
import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CreateUserFirebaseRepository implements ICreateUserFirebaseRepository {
  final ICreateUserFirebaseDatasource _datasource;

  CreateUserFirebaseRepository(
      {required ICreateUserFirebaseDatasource datasource})
      : _datasource = datasource;

  @override
  Future<Either<IAppFailure, UserCredential>> call({
    required String email,
    required String password,
  }) async {
    try {
      final result = await _datasource.call(email: email, password: password);
      return Right(result);
    } on FirebaseAuthException catch (e) {
      return Left(AppFailure(
        message: e.message ?? '',
        stackTrace: e.stackTrace,
      ));
    }
  }
}
