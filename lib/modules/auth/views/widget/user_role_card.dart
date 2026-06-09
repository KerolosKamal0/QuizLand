import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quizland/app/themes/app_palette.dart';

import '../../../../app/themes/app_colors.dart';

class RoleCard extends StatelessWidget {
  const RoleCard({
    super.key,
    required this.icon,
    required this.title,
    required this.active,
    required this.onTap,
  });

  final String icon;
  final String title;
  final bool active;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: active ? context.palette.surface : context.palette.inputBg,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: active
                ? AppColors.primary
                : AppColors.primary.withValues(alpha: 0.1),
            width: 2,
          ),
          boxShadow: active
              ? [
                  BoxShadow(
                    color: AppColors.primary.withValues(alpha: 0.18),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ]
              : null,
        ),
        child: Column(
          children: [
            SvgPicture.asset(icon, width: 44, height: 44),
            const SizedBox(height: 6),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 13,
                color: context.palette.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
