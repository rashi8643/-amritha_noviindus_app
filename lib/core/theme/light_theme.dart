import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:novi_indus_test/core/theme/color_palatte.dart';
import 'package:novi_indus_test/core/theme/extention/color_extention.dart';
import 'package:novi_indus_test/core/theme/extention/spaces_extention.dart';
import 'package:novi_indus_test/core/theme/extention/typography_extention.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'light_theme.g.dart';

final _lightTheme = ThemeData(brightness: Brightness.light, extensions: [
  AppColorExtension(
    primary: AppColorPalette.green,
    secondary: Colors.white,
    text: Colors.black,
    textInverse: AppColorPalette.gray,
    textSubtle: Colors.grey,
    textSubtlest: Colors.red,
    backgroundDanger: Colors.red,
  ),
  AppSpaceExtension.fromBaseSpace(8),
  AppTypographyExtension.fromColors(
    defaultFontColor: Colors.black,
    linkColor: Colors.blue,
    dimFontColor: Colors.grey,
  )
]);

@riverpod
ThemeData lightTheme(LightThemeRef ref) {
  return _lightTheme;
}
