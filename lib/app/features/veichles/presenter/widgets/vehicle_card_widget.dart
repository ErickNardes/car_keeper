import 'package:car_keeper/app/features/veichles/domain/entity/vehicle_entity.dart';
import 'package:flutter/material.dart';
import 'package:car_keeper/app/core/theme/theme_colors.dart';

class VehicleCard extends StatelessWidget {
  final VehicleEntity vehicle;
  final VoidCallback? onTap;

  const VehicleCard({
    super.key,
    required this.vehicle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${vehicle.make} ${vehicle.model} ${vehicle.year?.toInt() ?? ''}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: primaryColor,
                ),
              ),
              const SizedBox(height: 8),
              if (vehicle.plate != null && vehicle.plate!.isNotEmpty)
                Text(
                  'Plate: ${vehicle.plate}',
                  style: const TextStyle(fontSize: 14),
                ),
              if (vehicle.vin != null && vehicle.vin!.isNotEmpty)
                Text(
                  'VIN: ${vehicle.vin}',
                  style: const TextStyle(fontSize: 14),
                ),
              if (vehicle.mileage != null)
                Text(
                  'Mileage: ${vehicle.mileage!.toStringAsFixed(0)} km',
                  style: const TextStyle(fontSize: 14),
                ),
              Text(
                'Added on: ${vehicle.createdAt.day}/${vehicle.createdAt.month}/${vehicle.createdAt.year}',
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
