import 'package:get/get.dart';
import 'package:wayii/controllers/user_controllers.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get..put<UserController>(UserController());
  }
}
