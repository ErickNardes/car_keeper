import 'package:car_keeper/app/core/routes/app_routes.dart';
import 'package:car_keeper/app/features/auth/create_account/create_account_controller_bindings.dart';
import 'package:car_keeper/app/features/auth/create_account/presenter/page/create_account_page.dart';
import 'package:car_keeper/app/features/auth/login/login_bindings.dart';
import 'package:car_keeper/app/features/auth/login/presenter/page/login_page.dart';
import 'package:car_keeper/app/features/home/home_bindings.dart';
import 'package:car_keeper/app/features/home/presenter/page/home_page.dart';
import 'package:car_keeper/app/features/veichles/presenter/page/vehicles_page.dart';
import 'package:car_keeper/app/features/veichles/vehicles_bindings.dart';
import 'package:get/get.dart';

class AppPages {
  static final appPages = [
    GetPage(
      name: AppRoutes.loginPage,
      page: () => const LoginPage(),
      binding: LoginBindings(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: AppRoutes.createAccountPage,
      page: () => const CreateAccountPage(),
      binding: CreateAccountControllerBindings(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomePage(),
      binding: HomeBindings(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: AppRoutes.newVehiclesPage,
      page: () => const VehiclesPage(),
      binding: VehiclesBindings(),
      transition: Transition.cupertino,
    ),
  ];
}
