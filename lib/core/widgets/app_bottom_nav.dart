import 'package:flutter/material.dart';

import '../../app/themes/app_colors.dart';
import '../../app/themes/app_palette.dart';

class AppBottomNav extends StatelessWidget {
  const AppBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
    this.onCenterTap,
    this.showCenter = true,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;
  final VoidCallback? onCenterTap;
  final bool showCenter;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(18, 0, 18, 24),
          height: 65,
          decoration: BoxDecoration(
            color: palette.navBar,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.2),
                blurRadius: 24,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _NavIcon(
                icon: Icons.home_rounded,
                active: currentIndex == 0,
                onTap: () => onTap(0),
              ),
              _NavIcon(
                icon: Icons.search_rounded,
                active: currentIndex == 1,
                onTap: () => onTap(1),
              ),
              const SizedBox(width: 34),
              _NavIcon(
                icon: Icons.leaderboard_rounded,
                active: currentIndex == 2,
                onTap: () => onTap(2),
              ),
              _NavIcon(
                icon: Icons.person_rounded,
                active: currentIndex == 3,
                onTap: () => onTap(3),
              ),
            ],
          ),
        ),
        if (showCenter)
          Positioned(
            bottom: 50,
            child: GestureDetector(
              onTap: onCenterTap,
              child: Container(
                width: 58,
                height: 58,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                  border: Border.all(color: palette.navBar, width: 5),
                  boxShadow: [
                    BoxShadow(
                      color: palette.primary.withValues(alpha: 0.3),
                      blurRadius: 14,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: const Icon(Icons.add, color: Colors.white, size: 28),
              ),
            ),
          ),
      ],
    );
  }
}

class _NavIcon extends StatelessWidget {
  const _NavIcon({
    required this.icon,
    required this.active,
    required this.onTap,
  });

  final IconData icon;
  final bool active;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: SizedBox(
        width: 50,
        child: TweenAnimationBuilder<Color?>(
          duration: const Duration(milliseconds: 300),
          tween: ColorTween(
            begin: active
                ? palette.textSecondary.withValues(alpha: 0.5)
                : palette.primary,
            end: active
                ? palette.primary
                : palette.textSecondary.withValues(alpha: 0.5),
          ),
          builder: (context, color, child) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, color: color, size: 26),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.only(top: 4),
                  width: active ? 6 : 0,
                  height: active ? 6 : 0,
                  decoration: BoxDecoration(
                    color: palette.primary,
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
