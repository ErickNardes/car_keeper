import 'package:car_keeper/app/core/failure/i_app_failure.dart';
import 'package:car_keeper/app/features/veichles/domain/entity/vehicle_entity.dart';
import 'package:car_keeper/app/features/veichles/domain/params/insert_vehicle_params.dart';
import 'package:either_dart/either.dart';

abstract class IVehiclesRepository {
  Future<Either<IAppFailure, void>> insertVehicle(InsertVehicleParams params);
  Future<Either<IAppFailure, List<VehicleEntity>>> getListVehicles(int idUser);
}
