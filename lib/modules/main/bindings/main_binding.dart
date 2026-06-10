import 'package:get/get.dart';
import '../controllers/main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(() => MainController());

    // 4 tab controllers — created lazily on first tab visit
    // Get.lazyPut<HomeController>(() => HomeController());
    // Get.lazyPut<MembersController>(() => MembersController());
    // Get.lazyPut<AttendanceController>(() => AttendanceController());
    // Get.lazyPut<ProfileController>(() => ProfileController());
  }
}
