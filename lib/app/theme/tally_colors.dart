import 'package:flutter/material.dart';

import 'palette.dart';

class TallyColors extends ThemeExtension<TallyColors> {
  final Color bg;
  final Color surface;
  final Color sheetOrDoneTile;
  final Color navBar; // dark-only distinct slot; equals surface in light
  final Color text;
  final Color bodyCopy;
  final Color secondaryText;
  final Color muted;
  final Color border;
  final Color rule;
  final Color borderHover;
  final Color accent;
  final Color accentIcon;
  final Color accentText;
  final Color accentTintFill;
  final Color accentTintPressed;
  final Color scrim;

  const TallyColors({
    required this.bg,
    required this.surface,
    required this.sheetOrDoneTile,
    required this.navBar,
    required this.text,
    required this.bodyCopy,
    required this.secondaryText,
    required this.muted,
    required this.border,
    required this.rule,
    required this.borderHover,
    required this.accent,
    required this.accentIcon,
    required this.accentText,
    required this.accentTintFill,
    required this.accentTintPressed,
    required this.scrim,
  });

  static const light = TallyColors(
    bg: nocturneLightBg,
    surface: nocturneLightSurface,
    sheetOrDoneTile: nocturneLightCompletedTile,
    navBar: nocturneLightSurface,
    text: nocturneLightText,
    bodyCopy: nocturneLightBodyCopy,
    secondaryText: nocturneLightSecondaryText,
    muted: nocturneLightMuted,
    border: nocturneLightBorder,
    rule: nocturneLightRule,
    borderHover: nocturneLightBorderHover,
    accent: nocturneLightAccent,
    accentIcon: nocturneLightAccentIcon,
    accentText: nocturneLightAccentOnTint,
    accentTintFill: nocturneLightAccentTintFill,
    accentTintPressed: nocturneLightAccentTintPressed,
    scrim: nocturneLightScrim,
  );

  static const dark = TallyColors(
    bg: nocturneDarkBg,
    surface: nocturneDarkSurface,
    sheetOrDoneTile: nocturneDarkSheet,
    navBar: nocturneDarkNavBar,
    text: nocturneDarkText,
    bodyCopy: nocturneDarkBodyCopy,
    secondaryText: nocturneDarkSecondaryText,
    muted: nocturneDarkMuted,
    border: nocturneDarkBorder,
    rule: nocturneDarkRule,
    borderHover: nocturneDarkBorderHover,
    accent: nocturneDarkAccent,
    accentIcon: nocturneDarkAccentIcon,
    accentText: nocturneDarkAccentText,
    accentTintFill: nocturneDarkAccentTintFill,
    accentTintPressed: nocturneDarkAccentTintPressed,
    scrim: nocturneDarkScrim,
  );

  @override
  TallyColors copyWith() => this;

  @override
  TallyColors lerp(ThemeExtension<TallyColors>? other, double t) {
    if (other is! TallyColors) return this;
    return TallyColors(
      bg: Color.lerp(bg, other.bg, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      sheetOrDoneTile: Color.lerp(sheetOrDoneTile, other.sheetOrDoneTile, t)!,
      navBar: Color.lerp(navBar, other.navBar, t)!,
      text: Color.lerp(text, other.text, t)!,
      bodyCopy: Color.lerp(bodyCopy, other.bodyCopy, t)!,
      secondaryText: Color.lerp(secondaryText, other.secondaryText, t)!,
      muted: Color.lerp(muted, other.muted, t)!,
      border: Color.lerp(border, other.border, t)!,
      rule: Color.lerp(rule, other.rule, t)!,
      borderHover: Color.lerp(borderHover, other.borderHover, t)!,
      accent: Color.lerp(accent, other.accent, t)!,
      accentIcon: Color.lerp(accentIcon, other.accentIcon, t)!,
      accentText: Color.lerp(accentText, other.accentText, t)!,
      accentTintFill: Color.lerp(accentTintFill, other.accentTintFill, t)!,
      accentTintPressed: Color.lerp(
        accentTintPressed,
        other.accentTintPressed,
        t,
      )!,
      scrim: Color.lerp(scrim, other.scrim, t)!,
    );
  }
}
