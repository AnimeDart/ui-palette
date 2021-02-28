import 'package:flutter/painting.dart';
import '../config/palette_brightness.dart';

import 'gradient_palette.dart';

/// Generate a gradient palette that change [alpha] value for each [dp] value
abstract class AlphaGradientPalette extends GradientPalette {
  /// Generate a gradient palette that change [alpha] value for each [dp] value
  const AlphaGradientPalette({
    double baseHue,
    PaletteBrightness brightness,
    int dpCount,
    double variability,
    double offset,
    double saturation,
  }) : super(
          baseHue: baseHue,
          brightness: brightness,
          dpCount: dpCount,
          variability: variability,
          offset: offset ?? 0.5,
          saturation: saturation,
        );

  @override
  HSLColor fromDp(int dp) {
    validateDp(dp);

    final hslColor = HSLColor.fromAHSL(
      calcVariationWithBase(dp),
      baseHue ?? 0.0,
      saturation ?? 1,
      calcVariationWithBase(0),
    );

    return hslColor;
  }
}
