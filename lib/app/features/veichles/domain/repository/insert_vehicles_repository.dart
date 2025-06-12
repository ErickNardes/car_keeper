import 'package:car_keeper/app/core/failure/i_app_failure.dart';
import 'package:car_keeper/app/features/veichles/domain/entity/vehicle_entity.dart';
import 'package:car_keeper/app/features/veichles/domain/params/insert_vehicle_params.dart';
import 'package:car_keeper/app/features/veichles/infra/datasource/i_insert_vehicles_datasource.dart';
import 'package:car_keeper/app/features/veichles/infra/repository/i_insert_vehicle_repository.dart';
import 'package:either_dart/either.dart';

class VehiclesRepository implements IVehiclesRepository {
  final IVehicleDatasource _datasource;

  VehiclesRepository({required IVehicleDatasource datasource})
      : _datasource = datasource;

  @override
  Future<Either<IAppFailure, void>> insertVehicle(
      InsertVehicleParams params) async {
    try {
      final result = await _datasource.call(params);
      return Right(result);
    } on IAppFailure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<IAppFailure, List<VehicleEntity>>> getListVehicles(
      int idUser) async {
    try {
      final result = await _datasource.getListVehicles(idUser);
      return Right(result);
    } on IAppFailure catch (e) {
      return Left(e);
    }
  }
}
