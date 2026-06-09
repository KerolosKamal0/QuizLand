import 'package:flutter/material.dart';
import 'package:quizland/app/themes/app_colors.dart';
// import 'package:quizland/app/themes/app_palette.dart';

class AppTextButton extends StatelessWidget {
  final String label;
  final TextStyle? labelStyle;
  final VoidCallback? onPressed;
  final bool isLoading;
  final IconData? icon;
  final Color? color;
  final bool outlined;

  const AppTextButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.labelStyle,
    this.isLoading = false,
    this.icon,
    this.color,
    this.outlined = false,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveColor = color ?? AppColors.primary;

    final child = isLoading
        ? const SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: Colors.white,
            ),
          )
        : Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null) ...[
                Icon(icon, size: 18),
                const SizedBox(width: 8),
              ],
              Text(label, style: labelStyle),
            ],
          );

    if (outlined) {
      return OutlinedButton(
        onPressed: isLoading ? null : onPressed,
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 22),
          foregroundColor: effectiveColor,
          side: BorderSide(color: effectiveColor),
          // minimumSize: const Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: child,
      );
    }

    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(12),
        backgroundColor: effectiveColor,
        foregroundColor: Colors.white,
        // minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: child,
    );
  }
}
