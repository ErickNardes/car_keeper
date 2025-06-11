import 'package:car_keeper/app/features/veichles/domain/params/insert_vehicle_params.dart';

abstract class IInsertVehiclesDatasource {
  Future<void> call(InsertVehicleParams params);
}
