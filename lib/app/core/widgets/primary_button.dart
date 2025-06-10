import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:car_keeper/app/core/theme/theme_colors.dart';

class PrimaryButtonWidget extends StatelessWidget {
  final String title;
  final RxBool isLoading;
  final Function() onPressed;
  const PrimaryButtonWidget({
    super.key,
    required this.title,
    required this.isLoading,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: Get.width,
      child: Obx(() => ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
              shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(22))),
          onPressed: onPressed,
          child: isLoading.value
              ? const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.white),
                )
              : Text(
                  title,
                  style: TextStyle(
                    color: white,
                  ),
                ))),
    );
  }
}
