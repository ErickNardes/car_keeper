import 'package:car_keeper/app/core/failure/i_app_failure.dart';
import 'package:car_keeper/app/features/veichles/domain/entity/vehicle_entity.dart';
import 'package:car_keeper/app/features/veichles/domain/usecase/i_get_list_vehicles_usecase.dart';
import 'package:car_keeper/app/features/veichles/infra/repository/i_insert_vehicle_repository.dart';
import 'package:either_dart/either.dart';

class GetListVehiclesUsecase implements IGetListVehiclesUsecase {
  final IVehiclesRepository _repository;

  GetListVehiclesUsecase({required IVehiclesRepository repository})
      : _repository = repository;

  @override
  Future<Either<IAppFailure, List<VehicleEntity>>> getListVehicles(
      int idUser) async {
    return await _repository.getListVehicles(idUser);
  }
}
