import 'package:car_keeper/app/features/veichles/domain/usecase/i_insert_vehicle_usecase.dart';
import 'package:get/get.dart';

class VehiclesController extends GetxController {
  final IInsertVehicleUsecase _iInsertVehicleUsecase;

  RxString? selectedMake = ''.obs;
  RxString? selectedModel = ''.obs;

  VehiclesController({required IInsertVehicleUsecase iInsertVehicleUsecase})
      : _iInsertVehicleUsecase = iInsertVehicleUsecase;

  void selectModel(String value) {
    selectedModel?.value = value;
  }

  void selectMake(String value) {
    selectedMake?.value = value;
  }

  Future<void> insertVehicle() async {}
}
