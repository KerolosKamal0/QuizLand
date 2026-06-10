import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/routes/app_routes.dart';
import '../../../app/themes/app_palette.dart';
import '../../../app/themes/theme_controller.dart';
import '../../../core/models/user_model.dart';
import '../../../core/services/api_service.dart';
import '../../../core/widgets/app_bottom_nav.dart';
import '../../../core/widgets/app_text_botton.dart';
import '../../home/student_home_screen.dart';
import '../../home/teacher_home_screen.dart';
import '../controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  const MainView({super.key});
  static final GlobalKey<ScaffoldState> _scaffoldKey =
      GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final viewPadding = MediaQuery.of(context).viewPadding;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: context.palette.coloredBackground,
      // extendBody: true,
      // drawer: const AppDrawer(),
      // appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.only(
          top: viewPadding.top > 0 ? viewPadding.top : 12,
        ),
        child: Column(
          children: [
            Text(
              "App",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            AppTextButton(
              label: "Change Mode",

              onPressed: () {
                final themeCtrl = Get.find<ThemeController>();
                themeCtrl.toggleTheme();
              },
            ),
            SizedBox(height: 12),
            AppTextButton(
              label: "Logout",
              labelStyle: TextStyle(fontSize: 18, color: Colors.red),
              onPressed: () async {
                final api = Get.find<ApiService>();
                await api.signOut();
                Get.offAllNamed(Routes.LOGIN);
              },
            ),

            Expanded(
              child: Obx(() {
                if (!controller.isUserLoaded.value) {
                  return const Center(child: CircularProgressIndicator());
                }

                return IndexedStack(
                  index: controller.currentIndex,
                  children: [
                    controller.user?.userRole == UserRole.teacher
                        ? const TeacherHomeView()
                        : const StudentHomeView(),

                    Center(
                      child: Text(
                        "Search",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    Center(
                      child: Text(
                        "Leaderboard",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        "Profile",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                );
              }),
            ),
          ],
        ),
      ),

      bottomNavigationBar: Obx(
        () => AppBottomNav(
          currentIndex: controller.currentIndex,
          onTap: controller.changeTab,
          onCenterTap: () => controller.onCenterTap(context),
        ),
      ),
    );
  }
}
