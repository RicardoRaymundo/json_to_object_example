import 'package:flutter/material.dart';

import 'custom/theme_custom_colors.dart';
import 'custom/theme_custom_dark.dart';
import 'custom/theme_custom_darker.dart';
import 'custom/theme_custom_light.dart';

/// Opções de temas do app
enum ThemeAspect { LIGHT, DARK, DARKER, COLORS }

class ThemeSelect {
  /// Método que retorna o tema corresponde à opção recebida
  static ThemeData data(ThemeAspect aspect) {
    switch (aspect) {
      case ThemeAspect.LIGHT:
        return ThemeCustomLight.data;
      case ThemeAspect.DARK:
        return ThemeCustomDark.data;
      case ThemeAspect.DARKER:
        return ThemeCustomDarker.data;
      case ThemeAspect.COLORS:
        return ThemeCustomColors.data;
      default:
        return ThemeCustomLight.data;
    }
  }
}
//ThemeCustomColors
