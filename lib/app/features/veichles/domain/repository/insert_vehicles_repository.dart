import 'package:car_keeper/app/core/failure/i_app_failure.dart';
import 'package:car_keeper/app/features/veichles/domain/params/insert_vehicle_params.dart';
import 'package:car_keeper/app/features/veichles/infra/datasource/i_insert_vehicles_datasource.dart';
import 'package:car_keeper/app/features/veichles/infra/repository/i_insert_vehicle_repository.dart';
import 'package:either_dart/either.dart';

class InsertVehiclesRepository implements IInsertVehicleRepository {
  final IInsertVehiclesDatasource _datasource;

  InsertVehiclesRepository({required IInsertVehiclesDatasource datasource})
      : _datasource = datasource;

  @override
  Future<Either<IAppFailure, void>> call(InsertVehicleParams params) async {
    try {
      final result = await _datasource.call(params);
      return Right(result);
    } on IAppFailure catch (e) {
      return Left(e);
    }
  }
}
