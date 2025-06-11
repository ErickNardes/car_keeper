import 'package:car_keeper/app/core/hasura/i_hasura_service.dart';
import 'package:car_keeper/app/features/veichles/domain/params/insert_vehicle_params.dart';
import 'package:car_keeper/app/features/veichles/external/mappers/vehicles_mappers.dart';
import 'package:car_keeper/app/features/veichles/external/strings/insert_vehicle_string_mutation.dart';
import 'package:car_keeper/app/features/veichles/infra/datasource/i_insert_vehicles_datasource.dart';

class InsertVehiclesDatasource implements IInsertVehiclesDatasource {
  final IHasuraService _iHasuraService;

  InsertVehiclesDatasource({required IHasuraService iHasuraService})
      : _iHasuraService = iHasuraService;

  @override
  Future<void> call(InsertVehicleParams params) async {
    await _iHasuraService.mutation(
      document: insertVehicleStringMutation,
      variables: VehiclesMappers.toMap(params),
    );
  }
}
