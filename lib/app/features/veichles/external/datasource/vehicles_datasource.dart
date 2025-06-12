import 'package:car_keeper/app/core/hasura/i_hasura_service.dart';
import 'package:car_keeper/app/features/veichles/domain/entity/vehicle_entity.dart';
import 'package:car_keeper/app/features/veichles/domain/params/insert_vehicle_params.dart';
import 'package:car_keeper/app/features/veichles/external/mappers/vehicles_mappers.dart';
import 'package:car_keeper/app/features/veichles/external/strings/vehicles_hasura_strings.dart';
import 'package:car_keeper/app/features/veichles/infra/datasource/i_insert_vehicles_datasource.dart';

class VehiclesDatasource implements IVehicleDatasource {
  final IHasuraService _iHasuraService;

  VehiclesDatasource({required IHasuraService iHasuraService})
      : _iHasuraService = iHasuraService;

  @override
  Future<void> call(InsertVehicleParams params) async {
    await _iHasuraService.mutation(
      document: insertVehicleStringMutation,
      variables: VehiclesMappers.toMap(params),
    );
  }

  @override
  Future<List<VehicleEntity>> getListVehicles(int idUser) async {
    final response = await _iHasuraService
        .query(document: getVehiclesQuery, variables: {'idUser': idUser});

    final listData = List.from(response['data']['vehicles']);

    return listData.map((element) => VehiclesMappers.fromMap(element)).toList();
  }
}
