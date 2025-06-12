import 'package:car_keeper/app/core/auth/controller/auth_controller.dart';
import 'package:car_keeper/app/core/theme/theme_colors.dart';
import 'package:car_keeper/app/features/veichles/domain/params/insert_vehicle_params.dart';
import 'package:car_keeper/app/features/veichles/domain/usecase/i_insert_vehicle_usecase.dart';
import 'package:car_keeper/app/features/veichles/presenter/helpers/list_makes.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class VehiclesController extends GetxController {
  final IInsertVehicleUsecase _iInsertVehicleUsecase;
  InsertVehicleParams insertVehicleParams = InsertVehicleParams();
  final _authController = Get.find<AuthController>();

  RxString? selectedMake = ''.obs;
  RxString? selectedModel = ''.obs;
  List get modelList => carBrandsAndModels[selectedMake?.value] ?? [];
  final TextEditingController licensePlateController = TextEditingController();
  final TextEditingController currentMileageController =
      TextEditingController();
  final TextEditingController vinNumberController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  VehiclesController({required IInsertVehicleUsecase iInsertVehicleUsecase})
      : _iInsertVehicleUsecase = iInsertVehicleUsecase;

  void selectModel(String value) {
    selectedModel?.value = value;
  }

  void selectMake(String value) {
    selectedMake?.value = value;
  }

  Future<void> insertVehicle() async {
    if (formKey.currentState!.validate()) {
      insertVehicleParams = insertVehicleParams.copyWith(
        idUser: _authController.userAuthEntity!.id,
      );
      final result = await _iInsertVehicleUsecase.call(insertVehicleParams);

      result.fold((l) {
        Get.showSnackbar(GetSnackBar(
          backgroundColor: errorColor,
          duration: const Duration(seconds: 3),
          messageText: Text(l.message),
        ));
      }, (r) {
        Get.back();

        Get.showSnackbar(const GetSnackBar(
          backgroundColor: successColor,
          duration: Duration(seconds: 3),
          messageText: Text('Vehicle added with success!'),
        ));
      });
    }
  }
}
