import 'package:car_keeper/app/core/failure/i_app_failure.dart';
import 'package:car_keeper/app/features/veichles/domain/params/insert_vehicle_params.dart';
import 'package:car_keeper/app/features/veichles/infra/repository/i_insert_vehicle_repository.dart';
import 'package:car_keeper/app/features/veichles/domain/usecase/i_insert_vehicle_usecase.dart';
import 'package:either_dart/either.dart';

class InsertVehicleUsecase implements IInsertVehicleUsecase {
  final IInsertVehicleRepository _repository;

  InsertVehicleUsecase({required IInsertVehicleRepository repository})
      : _repository = repository;

  @override
  Future<Either<IAppFailure, void>> call(InsertVehicleParams params) async {
    return await _repository.call(params);
  }
}
