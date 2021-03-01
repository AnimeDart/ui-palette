import 'package:flutter/cupertino.dart';

import '../gradients/gradient_palette.dart';

/// Create a Background palette from
/// [dpCount], [brightness], [baseHue], [variability], [range]
class ElevationOverlay extends GradientPalette {
  /// Create a Background palette from
  /// [dpCount], [brightness], [baseHue], [variability], [range]
  const ElevationOverlay({
    int dpCount,
    Brightness brightness,
    double variability,
    double baseHue,
    double offset,
    double saturation,
  }) : super(
          dpCount: dpCount,
          brightness: brightness,
          variability: variability,
          baseHue: baseHue,
          offset: offset,
          saturation: saturation,
        );
}
