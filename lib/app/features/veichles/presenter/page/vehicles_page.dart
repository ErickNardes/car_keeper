import 'package:car_keeper/app/core/theme/theme_colors.dart';
import 'package:car_keeper/app/features/veichles/presenter/controller/vehicles_controller.dart';
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'required Field';
                }
                return null;
              },
              decoration: const InputDecoration(labelText: 'Make'),
              value: widget.controller.newVehiclesModel.make,
              items: widget.controller.listCars.keys.map((brand) {
                return DropdownMenuItem<String>(
                  value: brand,
                  child: Text(brand),
                );
              }).toList(),
              onChanged: (value) {
                controller.selectMake(value!);
                widget.controller.newVehiclesModel =
                    widget.controller.newVehiclesModel.copyWith(
                  make: value,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
