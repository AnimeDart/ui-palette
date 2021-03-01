import 'package:flutter/cupertino.dart';
import 'package:ui_palette/components/brand_complementar.dart';
import 'package:ui_palette/components/elevation_overlay.dart';
import 'package:ui_palette/components/high_to_low_emphasys_text.dart';
import 'package:ui_palette/components/surface_scheme.dart';

class MyAppTheme {
  final Brightness brightness;

  bool get isDark => brightness == Brightness.dark;

  MyAppTheme({this.brightness})
      : brand = BrandComplementar(
          baseHue: hue,
          brightness: brightness,
          dpCount: 4,
          variability: 0.05,
          offset: 0.0,
        ),
        text = HighToLowEmphasysText(
          brightness: brightness,
          dpCount: 4,
          variability: 0.15,
          baseHue: hue,
          saturation: 0.4,
        ),
        surface = SurfaceScheme(
          variability: 0.05,
          dpCount: 2,
          offset: 0.05,
          brightness: brightness,
        ),
        elevationOverlay = ElevationOverlay(
          baseHue: hue,
          brightness: brightness,
          dpCount: 4,
          variability: 0.03,
          saturation: 0.2,
          offset: 0.0,
        );

  static const hue = 210.0;

  /// Create the brand color based on HUE 0 (Red)
  /// with [Brightness.dark]
  final BrandComplementar brand;
  Color get primaryColor => brand[0][0];
  Color get secondaryColor => brand[1][0];
  Color get surfaceColor => surface[0];
  Color get overlayColor => elevationOverlay[2];
  Color get backgroundColor => elevationOverlay[1];

  /// Create a elevation overlay palette with [4] levels
  ///
  /// Color: black, because brightness is set to [dark]
  ///
  /// Darker to lighter, black to white, because brightness is set to [dark]
  final ElevationOverlay elevationOverlay;

  /// Surface UI Color scheme
  final SurfaceScheme surface;

  /// Same logic of elevation overlay but with [text]
  final HighToLowEmphasysText text;
}
