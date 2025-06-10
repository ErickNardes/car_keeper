import 'package:car_keeper/app/core/failure/i_app_failure.dart';

class AppFailure extends IAppFailure {
  AppFailure({required super.message, super.stackTrace});
}
