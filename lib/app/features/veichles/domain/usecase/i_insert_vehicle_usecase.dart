import 'package:car_keeper/app/core/failure/i_app_failure.dart';
import 'package:car_keeper/app/features/veichles/domain/params/insert_vehicle_params.dart';
import 'package:either_dart/either.dart';

abstract class IInsertVehicleUsecase {
  Future<Either<IAppFailure, void>> call(InsertVehicleParams params);
}
