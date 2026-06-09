import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:quizland/app/themes/app_palette.dart';
import 'package:quizland/app/themes/theme_controller.dart';
import '../../../app/themes/app_colors.dart';
import '../../../core/widgets/app_text_botton.dart';
import '../../../core/widgets/app_text_field.dart';
import '../controllers/auth_controller.dart';
import '../../../app/translations/locale_controller.dart';
import 'widget/segment_button.dart';
import 'widget/user_role_card.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: context.palette.coloredBackground),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    onPressed: () {
                      final themeCtrl = Get.find<ThemeController>();
                      themeCtrl.toggleTheme();
                    },
                    icon: Icon(Icons.dark_mode, color: Colors.white),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: AppTextButton(
                      label: 'language_label'.tr,
                      labelStyle: TextStyle(fontWeight: FontWeight.bold),
                      color: Colors.white,
                      outlined: true,
                      onPressed: () {
                        final localeCtrl = Get.find<LocaleController>();
                        if (localeCtrl.locale.languageCode == 'en') {
                          localeCtrl.changeLocale('ar', 'EG');
                        } else {
                          localeCtrl.changeLocale('en', 'US');
                        }
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Container(
                width: 76,
                height: 76,
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.95),
                  borderRadius: BorderRadius.circular(22),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.2),
                      blurRadius: 32,
                      offset: const Offset(0, 12),
                    ),
                  ],
                ),
                child: Center(
                  child: Image.asset("assets/images/icon_logo.png"),
                  // child: Image.asset("assets/images/logo.png"),
                ),
              ),
              const SizedBox(height: 6),
              Text(
                "app_name".tr,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
              Text(
                "app_tag".tr,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.2),
                    ),
                  ),
                  child: Obx(
                    () => Row(
                      children: [
                        Expanded(
                          child: SegmentButton(
                            label: "signin_label".tr,
                            active: controller.isLogin,
                            onTap: () => controller.setLoginMode(true),
                          ),
                        ),
                        Expanded(
                          child: SegmentButton(
                            label: "signup_label".tr,
                            active: !controller.isLogin,
                            onTap: () => controller.setLoginMode(false),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  child: Container(
                    padding: const EdgeInsets.all(26),
                    decoration: BoxDecoration(
                      color: context.palette.surface,
                      borderRadius: BorderRadius.circular(28),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.25),
                          blurRadius: 60,
                          offset: const Offset(0, 20),
                        ),
                      ],
                    ),
                    child: Obx(
                      () => SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              controller.isLogin
                                  ? "signin_welcome".tr
                                  : "signup_welcome".tr,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                                color: context.palette.textPrimary,
                              ),
                            ),
                            Text(
                              controller.isLogin
                                  ? "signin_sub_welcome".tr
                                  : "signup_sub_welcome".tr,
                              style: TextStyle(
                                fontSize: 12,
                                color: context.palette.textSecondary,
                              ),
                            ),
                            const SizedBox(height: 20),
                            if (!controller.isLogin) ...[
                              Row(
                                children: [
                                  Expanded(
                                    child: RoleCard(
                                      icon: 'assets/icons/student.svg',
                                      title: "student_label".tr,
                                      active:
                                          controller.role == UserRole.student,
                                      onTap: () =>
                                          controller.setRole(UserRole.student),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: RoleCard(
                                      icon: 'assets/icons/teacher.svg',
                                      title: "teacher_label".tr,
                                      active:
                                          controller.role == UserRole.teacher,
                                      onTap: () =>
                                          controller.setRole(UserRole.teacher),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              AppTextField(
                                // controller: nameController,
                                labelText: 'name_label'.tr,
                                keyboardType: TextInputType.text,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Name is required';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 12),
                            ],
                            AppTextField(
                              // controller: emailController,
                              labelText: 'email_label'.tr,
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Email is required';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 12),
                            AppTextField(
                              // controller: passwordController,
                              labelText: 'password_label'.tr,
                              keyboardType: TextInputType.visiblePassword,
                              isPassword: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Password is required';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 12),
                            if (!controller.isLogin) ...[
                              AppTextField(
                                // controller: confirmPasswordController,
                                labelText: 'confirm_password_label'.tr,
                                keyboardType: TextInputType.visiblePassword,
                                isPassword: true,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Confirm Password is required';
                                  }
                                  return null;
                                },
                              ),
                            ],
                            if (!controller.isLogin &&
                                controller.role == UserRole.teacher) ...[
                              const SizedBox(height: 12),
                              DottedBorder(
                                options: RoundedRectDottedBorderOptions(
                                  radius: const Radius.circular(12),
                                  dashPattern: const [6, 4],
                                  color: AppColors.primary,
                                  strokeWidth: 1,
                                  padding: EdgeInsets.zero,
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.primary.withValues(
                                      alpha: 0.12,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  padding: const EdgeInsets.all(12),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        'assets/icons/teacher.svg',
                                        width: 20,
                                        height: 20,
                                      ),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: Text(
                                          'teacher_hint'.tr,
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: AppColors.primary,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                            const SizedBox(height: 24),
                            AppTextButton(
                              label: controller.isLogin
                                  ? 'login_action'.tr
                                  : 'signup_action'.tr,
                              onPressed: () {},
                            ),
                            // const SizedBox(height: 12),
                            // Text(
                            //   "c.errorMessage!",
                            //   style: const TextStyle(
                            //     color: Colors.redAccent,
                            //     fontSize: 13,
                            //   ),
                            //   textAlign: TextAlign.center,
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
