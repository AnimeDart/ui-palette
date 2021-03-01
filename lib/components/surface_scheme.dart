import 'package:flutter/cupertino.dart';

import '../gradients/alpha_gradient_palette.dart';

/// Surface colors
class SurfaceScheme extends AlphaGradientPalette {
  /// Create a background palette with [dpCount]
  const SurfaceScheme({
    int dpCount,
    Brightness brightness,
    double variability,
    double offset,
  }) : super(
          dpCount: dpCount,
          variability: variability,
          offset: offset ?? 0.07,
          brightness: brightness == Brightness.dark
              ? Brightness.light
              : Brightness.dark,
        );

  @override
  double get base => offset;

  @override
  HSLColor fromDp(int dp) {
    return HSLColor.fromAHSL(
      calcVariationWithBase(dp),
      baseHue ?? 0.0,
      0.0,
      brightness == Brightness.dark ? 0.0 : 1.0,
    );
  }
}
