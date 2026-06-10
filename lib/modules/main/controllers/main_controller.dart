import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/models/user_model.dart';
import '../../../core/utils/helpers.dart';
import '../providers/main_provider.dart';

class MainController extends GetxController {
  final _provider = MainProvider();

  // ── Load state (for other controllers to wait on) ───────────────
  final isUserLoaded = false.obs;
  final loadError = RxnString();

  // ── Tab index ──────────────────────────────────────────────────
  final _currentIndex = 0.obs;
  int get currentIndex => _currentIndex.value;
  void changeTab(int index) => _currentIndex.value = index;
  void onCenterTap(BuildContext context) {
    // if (isTeacher) {
    //   context.push('/create-quiz');
    // } else {
    //   showJoinClassSheet(context);
    // }
  }

  // ── User data ──────────────────────────────────────────────────
  final _user = Rxn<UserModel>();
  UserModel? get user => _user.value;

  @override
  void onInit() {
    super.onInit();
    _loadUser();
  }

  // ── Load User data ─────────────────────────────────────────────
  Future<void> _loadUser() async {
    isUserLoaded.value = false;
    loadError.value = null;
    try {
      final userData = await _provider.userData();

      if (userData.success) {
        _user.value = userData.data;
        isUserLoaded.value = true;
      } else {
        loadError.value = userData.error ?? 'Login failed';
        AppHelpers.showError(userData.error ?? 'Login failed');
      }
    } catch (e) {
      loadError.value = AppHelpers.parseError(e);
      AppHelpers.showError(AppHelpers.parseError(e));
    }
  }
}
