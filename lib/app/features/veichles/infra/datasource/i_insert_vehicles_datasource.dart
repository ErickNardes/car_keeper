import 'package:car_keeper/app/features/veichles/domain/entity/vehicle_entity.dart';
import 'package:car_keeper/app/features/veichles/domain/params/insert_vehicle_params.dart';

abstract class IVehicleDatasource {
  Future<void> call(InsertVehicleParams params);
  Future<List<VehicleEntity>> getListVehicles(int idUser);
}
