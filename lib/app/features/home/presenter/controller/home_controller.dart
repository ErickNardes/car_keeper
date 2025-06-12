import 'package:get/get.dart';

import 'package:car_keeper/app/core/auth/controller/auth_controller.dart';
import 'package:car_keeper/app/features/veichles/domain/entity/vehicle_entity.dart';
import 'package:car_keeper/app/features/veichles/domain/usecase/i_get_list_vehicles_usecase.dart';

class HomeController extends GetxController {
  final IGetListVehiclesUsecase iGetListVehiclesUsecase;
  final authController = Get.find<AuthController>();

  RxList<VehicleEntity> listVehicles = <VehicleEntity>[].obs;
  HomeController({
    required this.iGetListVehiclesUsecase,
  });

  @override
  void onInit() {
    getListVehicles();
    super.onInit();
  }

  Future<void> getListVehicles() async {
    final result = await iGetListVehiclesUsecase
        .getListVehicles(authController.userAuthEntity!.id);

    result.fold((l) {}, (r) => listVehicles.value = r);
  }
}
