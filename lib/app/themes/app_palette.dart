import 'package:flutter/material.dart';

import 'app_colors.dart';

@immutable
class AppPalette extends ThemeExtension<AppPalette> {
  const AppPalette({
    required this.primary,
    required this.background,
    required this.cardBackground,
    required this.coloredBackground,
    required this.surface,
    required this.surfaceMuted,
    required this.textPrimary,
    required this.textSecondary,
    required this.border,
    required this.inputBg,
    required this.navBar,
    required this.tabTrack,
    required this.cardFill,
    required this.pinkCard,
    required this.headerOverlay,
  });

  final Color background;
  final Color primary;
  final Color cardBackground;
  final Color coloredBackground;
  final Color surface;
  final Color surfaceMuted;
  final Color textPrimary;
  final Color textSecondary;
  final Color border;
  final Color inputBg;
  final Color navBar;
  final Color tabTrack;
  final Color cardFill;
  final Color pinkCard;
  final Color headerOverlay;

  static const light = AppPalette(
    primary: AppColors.primary,
    background: Color(0xFFF5F3FF),
    coloredBackground: AppColors.primary,
    cardBackground: AppColors.primary,
    surface: Color(0xFFFFFFFF),
    surfaceMuted: Color(0xFFF9F8FF),
    textPrimary: Color(0xFF1A1333),
    textSecondary: Color(0xFF8A849E),
    // border: Color(0xFFEFEAFD),
    border: Color(0xFFF4FCF6),
    inputBg: Color(0xFFF7F5FF),
    navBar: Color(0xFFFFFFFF),
    tabTrack: Color(0xFFF5F3FD),
    cardFill: Color(0xFFF9F8FF),
    pinkCard: Color(0xFFFFD5DF),
    headerOverlay: Color(0x1FFFFFFF),
  );

  static const dark = AppPalette(
    primary: AppColors.primary,
    // background: Color(0xFF0F0D18),
    background: Color(0xFF1A1628),
    // coloredBackground: Color(0xFF0F0D18),
    coloredBackground: Color(0xFF140E39),
    cardBackground: Color(0xFF1A1628),
    surface: Color(0xFF1A1628),
    surfaceMuted: Color(0xFF221E32),
    textPrimary: Color(0xFFF2EFFA),
    textSecondary: Color(0xFF9E97B5),
    border: Color(0xFF2E2942),
    inputBg: Color(0xFF1E1A2E),
    navBar: Color(0xFF1A1628),
    tabTrack: Color(0xFF221E32),
    cardFill: Color(0xFF221E32),
    pinkCard: Color(0xFF3D2430),
    headerOverlay: Color(0x24FFFFFF),
  );

  @override
  AppPalette copyWith({
    Color? primary,
    Color? coloredBackground,
    Color? background,
    Color? cardBackground,
    Color? surface,
    Color? surfaceMuted,
    Color? textPrimary,
    Color? textSecondary,
    Color? border,
    Color? inputBg,
    Color? navBar,
    Color? tabTrack,
    Color? cardFill,
    Color? pinkCard,
    Color? headerOverlay,
  }) {
    return AppPalette(
      primary: primary ?? this.primary,
      background: background ?? this.background,
      coloredBackground: coloredBackground ?? this.coloredBackground,
      cardBackground: cardBackground ?? this.cardBackground,
      surface: surface ?? this.surface,
      surfaceMuted: surfaceMuted ?? this.surfaceMuted,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      border: border ?? this.border,
      inputBg: inputBg ?? this.inputBg,
      navBar: navBar ?? this.navBar,
      tabTrack: tabTrack ?? this.tabTrack,
      cardFill: cardFill ?? this.cardFill,
      pinkCard: pinkCard ?? this.pinkCard,
      headerOverlay: headerOverlay ?? this.headerOverlay,
    );
  }

  @override
  AppPalette lerp(ThemeExtension<AppPalette>? other, double t) {
    if (other is! AppPalette) return this;
    return AppPalette(
      primary: Color.lerp(primary, other.primary, t)!,
      coloredBackground: Color.lerp(
        coloredBackground,
        other.coloredBackground,
        t,
      )!,
      background: Color.lerp(background, other.background, t)!,
      cardBackground: Color.lerp(cardBackground, other.cardBackground, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      surfaceMuted: Color.lerp(surfaceMuted, other.surfaceMuted, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      border: Color.lerp(border, other.border, t)!,
      inputBg: Color.lerp(inputBg, other.inputBg, t)!,
      navBar: Color.lerp(navBar, other.navBar, t)!,
      tabTrack: Color.lerp(tabTrack, other.tabTrack, t)!,
      cardFill: Color.lerp(cardFill, other.cardFill, t)!,
      pinkCard: Color.lerp(pinkCard, other.pinkCard, t)!,
      headerOverlay: Color.lerp(headerOverlay, other.headerOverlay, t)!,
    );
  }
}

extension AppPaletteContext on BuildContext {
  AppPalette get palette => Theme.of(this).extension<AppPalette>()!;
}
