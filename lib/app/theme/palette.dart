import 'package:flutter/material.dart';

// ─── Nocturne Light ────────────────────────────────────────────────────────

const nocturneLightBg = Color(0xFFF4F4F7); // bg / ground
const nocturneLightSurface = Color(0xFFFBFBFD); // surface / sheet / nav
const nocturneLightCompletedTile = Color(0xFFF8F8FB); // completed tile
const nocturneLightText = Color(0xFF161826); // text

const nocturneLightBodyCopy = Color(0xFF3F424D); // body copy
const nocturneLightSecondaryText = Color(0xFF595D6C); // secondary text
const nocturneLightMuted = Color(0xFF75798C); // muted / labels
const nocturneLightBorder = Color(0xFFDCDCE4); // border

const nocturneLightRule = Color(0xFFE4E4EC); // rule / tile hairline
const nocturneLightHoverFill = Color(0xFFECECF2); // hover / low tag fill
const nocturneLightBorderHover = Color(0xFFB7BAC7); // border hover / strike
const nocturneLightAccent = Color(0xFF9184D9); // accent

const nocturneLightAccentIcon = Color(0xFF5D5294); // accent icon / small text
const nocturneLightAccentOnTint = Color(0xFF463C78); // text on accent tint
const nocturneLightAccentTintFill = Color(0xFFE7E5FE); // accent tint fill
const nocturneLightAccentTintPressed = Color(
  0xFFC9C3FB,
); // accent tint pressed / border

// Scrim: rgba(22,24,38,.32)
const nocturneLightScrim = Color(0x52161826);
// Splash ground: radial gradient nocturneLightSurface → nocturneLightBg
const nocturneLightSplashGradientStart = nocturneLightSurface;
const nocturneLightSplashGradientEnd = nocturneLightBg;

// ─── Nocturne Dark ─────────────────────────────────────────────────────────

const nocturneDarkBg = Color(0xFF161826); // bg / ground
const nocturneDarkSurface = Color(0xFF232532); // surface / tile
const nocturneDarkSheet = Color(0xFF1C1E2C); // sheet / dialog / done tile
const nocturneDarkNavBar = Color(0xFF1A1C2B); // nav bar / drawer

const nocturneDarkText = Color(0xFFE9E9ED); // text
const nocturneDarkBodyCopy = Color(0xFFCFD3E5); // body copy
const nocturneDarkSecondaryText = Color(0xFF9397AB); // secondary text
const nocturneDarkMuted = Color(0xFF75798C); // muted / labels

const nocturneDarkBorder = Color(0xFF3F424D); // border
const nocturneDarkRule = Color(0xFF292B31); // rule / low tag fill
const nocturneDarkBorderHover = Color(0xFF595D6C); // border hover / strike
const nocturneDarkAccent = Color(0xFF9184D9); // accent (blurple)

const nocturneDarkAccentIcon = Color(0xFFB5ABFC); // accent icon / label
const nocturneDarkAccentText = Color(0xFFD2CEFD); // accent text
const nocturneDarkAccentTintFill = Color(0xFF2B2741); // accent tint fill
const nocturneDarkAccentTintPressed = Color(
  0xFF423A6A,
); // accent tint pressed / border

// Scrim: rgba(10,11,18,.66)
const nocturneDarkScrim = Color(0xA80A0B12);
// Splash ground: radial gradient nocturneDarkSurface (12% 8%) → nocturneDarkBg (62%)
const nocturneDarkSplashGradientStart = nocturneDarkSurface;
const nocturneDarkSplashGradientEnd = nocturneDarkBg;
