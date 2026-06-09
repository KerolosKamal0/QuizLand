import 'package:get/get.dart';

enum UserRole { student, teacher }

class AuthController extends GetxController {
  final _isLogin = true.obs;
  bool get isLogin => _isLogin.value;

  final Rx<UserRole> _role = UserRole.student.obs;
  UserRole get role => _role.value;

  void setLoginMode(bool login) {
    if (isLogin == login) return;
    _isLogin.value = login;
    // errorMessage = null;
  }

  void setRole(UserRole value) {
    _role.value = value;
  }
}
