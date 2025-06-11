// ignore_for_file: deprecated_member_use

import 'package:car_keeper/app/core/routes/app_routes.dart';
import 'package:car_keeper/app/core/theme/theme_colors.dart';
import 'package:car_keeper/app/features/home/presenter/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

late PageController _pageController;
int currentIndex = 0;
final controller = Get.find<HomeController>();

void changePageIndex(int index) {
  currentIndex = index;
  _pageController.jumpToPage(index);
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: primaryColor,
        automaticallyImplyLeading: false,
        title: Text(
          'Hello, ${controller.authController.userAuthEntity!.name}',
          style: const TextStyle(color: white),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        onPressed: () {
          Get.toNamed(AppRoutes.newVehiclesPage);
        },
        child: const Icon(
          Icons.add_outlined,
          color: Colors.white,
        ),
      ),
      body: PageView(
        controller: _pageController,
        children: [
          Container(),
          Container(),
          Container(),
          Container(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: primaryColor,
          unselectedItemColor: grayLightColor,
          selectedIconTheme: const IconThemeData(color: primaryColor),
          unselectedIconTheme: const IconThemeData(color: grayLightColor),
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
              _pageController.jumpToPage(index);
              _pageController.animateToPage(index,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn);
            });
          },
          items: [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(
                Icons.car_repair_outlined,
                color: currentIndex == 0 ? primaryColor : grayLightColor,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Reminders',
              icon: Icon(
                Icons.alarm_rounded,
                color: currentIndex == 1 ? primaryColor : grayLightColor,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Maintenance',
              icon: Icon(
                Icons.car_repair,
                color: currentIndex == 2 ? primaryColor : grayLightColor,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Recalls',
              icon: Icon(
                Icons.info_outline,
                color: currentIndex == 3 ? primaryColor : grayLightColor,
              ),
            ),
          ]),
    );
  }
}
