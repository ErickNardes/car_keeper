// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:car_keeper/app/features/veichles/presenter/widgets/vehicle_card_widget.dart';
import 'package:flutter/material.dart';

import 'package:car_keeper/app/features/home/presenter/controller/home_controller.dart';
import 'package:get/get.dart';

class HomePageContent extends StatefulWidget {
  final HomeController controller;
  const HomePageContent({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<HomePageContent> createState() => _HomePageContentState();
}

class _HomePageContentState extends State<HomePageContent> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => ListView.separated(
        separatorBuilder: (context, index) => SizedBox(
              height: 16,
            ),
        itemCount: widget.controller.listVehicles.length,
        itemBuilder: (context, index) {
          final vehicle = widget.controller.listVehicles[index];
          return VehicleCard(vehicle: vehicle);
        }));
  }
}
