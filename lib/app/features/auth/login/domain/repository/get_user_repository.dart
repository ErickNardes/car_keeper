import 'package:car_keeper/app/core/failure/i_app_failure.dart';
import 'package:car_keeper/app/features/auth/login/domain/entities/user_harura_entity.dart';
import 'package:car_keeper/app/features/auth/login/infra/datasource/i_get_user_datasource.dart';
import 'package:car_keeper/app/features/auth/login/infra/repository/i_get_user_repository.dart';
import 'package:either_dart/either.dart';

class GetUserRepository implements IGetUserRepository {
  final IGetUserDatasource _datasource;

  GetUserRepository({
    required IGetUserDatasource datasource,
  }) : _datasource = datasource;

  @override
  Future<Either<IAppFailure, UserHaruraEntity>> call(String email) async {
    try {
      final result = await _datasource.call(email);
      return Right(result);
    } on IAppFailure catch (e) {
      return Left(e);
    }
  }
}
