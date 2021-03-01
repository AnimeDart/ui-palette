import 'dart:ui';

import 'package:flutter/painting.dart';

import '../config/palette_harmony.dart';
import '../gradients/gradient_palette.dart';
import '../interfaces/ui_scheme.dart';

/// Create a brand complementar color
class BrandComplementar implements BrandScheme {
  /// [HUE] value used as base for all other brand colors
  /// Int value to calc brightness for all [dp] levels
  final double baseHue;

  /// Palette brightness, used for all brand colors
  final Brightness brightness;

  /// [dp] count for all brand colors
  ///
  /// If you want to get color count of brand palette,
  /// use [.colorCount] instead
  final int dpCount;

  /// Variability of color brightness for each [dp] level
  /// Create the brand color scheme from [baseHue]
  final double variability;

  /// Modify the value of max dp
  final double offset;

  /// Saturation of all brand colors
  final double saturation;

  /// If brand color is black (for light themes)
  /// or white (for dark themes), set baseHue to null
  const BrandComplementar({
    this.baseHue,
    this.variability,
    this.brightness,
    this.dpCount,
    this.offset,
    this.saturation,
  }) : assert(
          baseHue != null ? baseHue >= 0 && baseHue <= 360 : true,
          '''[baseHue] must be a double between 0 and 360''',
        );

  @override
  int get colorCount => 2;

  @override
  PaletteHarmony get harmony => PaletteHarmony.complementar;

  @override
  UISchemeHueBased<int, Color> get primary => this[0];

  /// Secondary color generated from [baseHue] using
  /// complementar algorithm (primary rotared 180deg)
  UISchemeHueBased<int, Color> get secondary => this[1];

  @override
  List<Object> get props => [..._colors.values];

  @override
  bool get stringify => false;

  Map<int, UISchemeHueBased<int, Color>> get _colors => {
        0: _PrimaryColorScheme(
          baseHue: baseHue,
          variability: variability,
          brightness: brightness,
          dpCount: dpCount,
          offset: offset,
          saturation: saturation,
        ),
        1: _SecondaryColorScheme(
          baseHue: baseHue,
          variability: variability,
          brightness: brightness,
          dpCount: dpCount,
          offset: offset,
          saturation: saturation,
        ),
      };

  @override
  UISchemeHueBased<int, Color> operator [](int color) {
    final target = _colors[color];

    if (target == null) throw RangeError.range(color, 0, colorCount);

    return target;
  }
}

abstract class _BrandScheme extends GradientPalette {
  const _BrandScheme({
    double baseHue,
    Brightness brightness,
    int dpCount,
    double variability,
    double offset,
    double saturation,
  }) : super(
          baseHue: baseHue,
          brightness: brightness == Brightness.dark
              ? Brightness.light
              : Brightness.dark,
          dpCount: dpCount ?? 5,
          variability: variability ?? 0.05,
          offset: brightness == Brightness.dark || baseHue == null
              ? offset ?? 0.05
              : 0.5,
          saturation: saturation,
        );

  @override
  HSLColor fromDp(int dp) {
    final hsl = super.fromDp(dp);

    final luminance = hsl.toColor().computeLuminance();

    const limit = 0.3;

    return luminance > limit && brightness == Brightness.dark
        ? hsl.withLightness(limit)
        : hsl;
  }
}

class _PrimaryColorScheme extends _BrandScheme {
  const _PrimaryColorScheme({
    double baseHue,
    Brightness brightness,
    int dpCount,
    double variability,
    double offset,
    double saturation,
  }) : super(
          baseHue: baseHue,
          brightness: brightness,
          dpCount: dpCount,
          variability: variability,
          offset: offset,
          saturation: saturation,
        );
}

class _SecondaryColorScheme extends _BrandScheme {
  const _SecondaryColorScheme({
    double baseHue,
    Brightness brightness,
    int dpCount,
    double variability,
    double offset,
    double saturation,
  }) : super(
          baseHue: (baseHue + 180) % 360,
          brightness: brightness,
          dpCount: dpCount,
          variability: variability,
          offset: offset,
          saturation: saturation,
        );
}
