import 'package:car_keeper/app/core/failure/i_app_failure.dart';
import 'package:car_keeper/app/features/veichles/domain/entity/vehicle_entity.dart';
import 'package:either_dart/either.dart';

abstract class IGetListVehiclesUsecase {
  Future<Either<IAppFailure, List<VehicleEntity>>> getListVehicles(int idUser);
}
