import 'package:car_keeper/app/core/hasura/i_hasura_service.dart';
import 'package:car_keeper/app/features/veichles/domain/repository/insert_vehicles_repository.dart';
import 'package:car_keeper/app/features/veichles/domain/usecase/i_insert_vehicle_usecase.dart';
import 'package:car_keeper/app/features/veichles/domain/usecase/insert_vehicle_usecase.dart';
import 'package:car_keeper/app/features/veichles/external/datasource/vehicles_datasource.dart';
import 'package:car_keeper/app/features/veichles/infra/datasource/i_insert_vehicles_datasource.dart';
import 'package:car_keeper/app/features/veichles/infra/repository/i_insert_vehicle_repository.dart';
import 'package:car_keeper/app/features/veichles/presenter/controller/vehicles_controller.dart';
import 'package:get/get.dart';

class VehiclesBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IVehicleDatasource>(
        () => VehiclesDatasource(iHasuraService: Get.find<IHasuraService>()));
    Get.lazyPut<IVehiclesRepository>(
        () => VehiclesRepository(datasource: Get.find<IVehicleDatasource>()));
    Get.lazyPut<IInsertVehicleUsecase>(() =>
        InsertVehicleUsecase(repository: Get.find<IVehiclesRepository>()));

    Get.lazyPut<VehiclesController>(() => VehiclesController(
        iInsertVehicleUsecase: Get.find<IInsertVehicleUsecase>()));
  }
}
