import 'package:car_keeper/app/core/theme/theme_colors.dart';
import 'package:car_keeper/app/core/widgets/custom_text_form_field.dart';
import 'package:car_keeper/app/core/widgets/primary_button.dart';
import 'package:car_keeper/app/features/veichles/presenter/controller/vehicles_controller.dart';
import 'package:car_keeper/app/features/veichles/presenter/helpers/list_makes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VehiclesPage extends GetView<VehiclesController> {
  const VehiclesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: white),
        centerTitle: true,
        toolbarHeight: 80,
        backgroundColor: primaryColor,
        title: const Text(
          'Add Vehicle',
          style: TextStyle(color: white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Make',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      DropdownButtonFormField<String>(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'required Field';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            hintText: 'Select make',
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide:
                                    const BorderSide(color: grayLightColor)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12))),
                        value: controller.insertVehicleParams.make,
                        items: carBrandsAndModels.keys.map((brand) {
                          return DropdownMenuItem<String>(
                            value: brand,
                            child: Text(brand),
                          );
                        }).toList(),
                        onChanged: (value) {
                          controller.selectMake(value!);
                          controller.insertVehicleParams =
                              controller.insertVehicleParams.copyWith(
                            make: value,
                          );
                        },
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const Text(
                        'Model',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Obx(
                        () => DropdownButtonFormField<String>(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'required Field';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              hintText: 'Select model',
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: grayLightColor),
                                  borderRadius: BorderRadius.circular(12)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12))),
                          value: controller.modelList
                                  .contains(controller.selectedModel?.value)
                              ? controller.selectedModel?.value
                              : null,
                          items: controller.modelList.map((model) {
                            return DropdownMenuItem<String>(
                              value: model,
                              child: Text(model),
                            );
                          }).toList(),
                          onChanged: (value) {
                            controller.selectModel(value!);
                            controller.insertVehicleParams =
                                controller.insertVehicleParams.copyWith(
                              model: value,
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const Text(
                        'Year',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      DropdownButtonFormField<int>(
                        validator: (value) {
                          if (value == null) {
                            return 'Required Field';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            hintText: 'Select year',
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(
                                  color: grayLightColor,
                                )),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12))),
                        value: controller.insertVehicleParams.year,
                        items: List.generate(50, (index) {
                          final year = DateTime.now().year - index;
                          return DropdownMenuItem<int>(
                            value: year,
                            child: Text(year.toString()),
                          );
                        }),
                        onChanged: (value) {
                          controller.insertVehicleParams =
                              controller.insertVehicleParams.copyWith(
                            year: value,
                          );
                        },
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const Text(
                        'License Plate',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      CustomTextFormFieldWidget(
                        hintText: 'Enter license plate',
                        onChanged: (value) {
                          controller.insertVehicleParams =
                              controller.insertVehicleParams.copyWith(
                            plate: value,
                          );
                        },
                        controller: controller.licensePlateController,
                        keyboardType: TextInputType.text,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const Text(
                        'Current Mileage',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      CustomTextFormFieldWidget(
                        hintText: 'Enter mileage',
                        onChanged: (value) {
                          controller.insertVehicleParams =
                              controller.insertVehicleParams.copyWith(
                            km: int.parse(value),
                          );
                        },
                        controller: controller.currentMileageController,
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const Text(
                        'VIN Number',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      CustomTextFormFieldWidget(
                        hintText: 'Enter VIN',
                        onChanged: (value) {
                          controller.insertVehicleParams =
                              controller.insertVehicleParams.copyWith(
                            vin: value,
                          );
                        },
                        controller: controller.vinNumberController,
                        keyboardType: TextInputType.text,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            PrimaryButtonWidget(
              title: 'Register',
              isLoading: false.obs,
              onPressed: () {
                controller.insertVehicle();
              },
            ),
          ],
        ),
      ),
    );
  }
}
