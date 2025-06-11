import 'package:car_keeper/app/core/hasura/i_hasura_service.dart';
import 'package:car_keeper/app/features/veichles/domain/repository/insert_vehicles_repository.dart';
import 'package:car_keeper/app/features/veichles/domain/usecase/i_insert_vehicle_usecase.dart';
import 'package:car_keeper/app/features/veichles/domain/usecase/insert_vehicle_usecase.dart';
import 'package:car_keeper/app/features/veichles/external/datasource/insert_vehicles_datasource.dart';
import 'package:car_keeper/app/features/veichles/infra/datasource/i_insert_vehicles_datasource.dart';
import 'package:car_keeper/app/features/veichles/infra/repository/i_insert_vehicle_repository.dart';
import 'package:car_keeper/app/features/veichles/presenter/controller/vehicles_controller.dart';
import 'package:get/get.dart';

class VehiclesBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IInsertVehiclesDatasource>(() =>
        InsertVehiclesDatasource(iHasuraService: Get.find<IHasuraService>()));
    Get.lazyPut<IInsertVehicleRepository>(() => InsertVehiclesRepository(
        datasource: Get.find<IInsertVehiclesDatasource>()));
    Get.lazyPut<IInsertVehicleUsecase>(() =>
        InsertVehicleUsecase(repository: Get.find<IInsertVehicleRepository>()));

    Get.lazyPut<VehiclesController>(() => VehiclesController(
        iInsertVehicleUsecase: Get.find<IInsertVehicleUsecase>()));
  }
}
