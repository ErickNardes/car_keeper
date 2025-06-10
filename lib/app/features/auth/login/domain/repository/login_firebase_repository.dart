import 'package:car_keeper/app/core/failure/app_failure.dart';
import 'package:car_keeper/app/core/failure/i_app_failure.dart';
import 'package:car_keeper/app/features/auth/login/infra/datasource/I_login_firebase_datasource.dart';
import 'package:car_keeper/app/features/auth/login/infra/repository/i_login_firebase_repository.dart';
import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginFirebaseRepository implements ILoginFirebaseRepository {
  final ILoginFirebaseDatasource _datasource;

  LoginFirebaseRepository({
    required ILoginFirebaseDatasource datasource,
  }) : _datasource = datasource;

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
        message: e.message ?? 'Error',
        stackTrace: e.stackTrace,
      ));
    }
  }
}
