import 'dart:ui';

import 'package:meta/meta.dart';
import 'package:flutter/painting.dart';

import '../config/palette_brightness.dart';
import '../interfaces/ui_scheme.dart';

/// Create a Background palette from
/// [dpCount], [brightness], [baseHue], [variability], [range]
abstract class GradientPalette implements UISchemeHueBased<int, Color> {
  static const _defaultDpCount = 4;
  static const _defaultBrightness = PaletteBrightness.dark;
  static const _defaultVariability = 0.1;
  static const _defaultOffset = 0.0;
  static const _defaultSaturation = 1.0;

  /// Palette colors count, if [dpCount = 2], you can get:
  ///
  /// `background[0]` // Ok
  /// `background[1]` // Ok
  /// `background[2]` // Throws a [RangeError]
  int get dpCount => _dpCount ?? _defaultDpCount;
  final int _dpCount;

  /// Brightness for all palette colors
  PaletteBrightness get brightness => _brightness ?? _defaultBrightness;
  final PaletteBrightness _brightness;

  /// Base [HUE] used for all computed colors,
  /// if null, the base color will be black if [brightness] is dark
  /// or white if [brightness] is light
  double get baseHue => _baseHue;
  final double _baseHue;

  /// Linear increase of color lightness
  double get variability => _variability ?? _defaultVariability;
  final double _variability;

  /// Offset of max value if brightness is [PaletteBrightness.light]
  ///
  /// Offset of min value if brightness is [PaletteBrightness.dark]
  double get offset => _offset ?? _defaultOffset;
  final double _offset;

  /// Palette saturation
  ///
  /// If palette is monochrome [baseHue == null], this will be ignored
  double get saturation => _saturation ?? _defaultSaturation;
  final double _saturation;

  /// Create a background palette with [dpCount]
  const GradientPalette({
    int dpCount,
    PaletteBrightness brightness,
    double variability,
    double baseHue,
    double offset,
    double saturation,
  })  : _baseHue = baseHue,
        _offset = offset,
        _variability = variability,
        _brightness = brightness,
        _dpCount = dpCount,
        _saturation = saturation,
        assert(
          (variability ?? _defaultVariability) * (dpCount ?? _defaultDpCount) +
                  (offset ?? 0) <=
              1,
          '''This error means that you are sending a [variability], [offset] and a [dpCount] in which it does not respect the constraint <= 1, so it is not possible to form a color gradient palette with this configuration since some or some values of the getters ([N]) will be without respective brightness value in the gradient''',
        );

  /// Return **true** if [baseHue] is null, otherwise false
  bool get isMonochrome => baseHue == null;

  @override
  List<Object> get props => [dpCount, brightness, baseHue, variability];

  @override
  bool get stringify => false;

  @override
  Color operator [](int dp) {
    return fromDp(dp).toColor();
  }

  /// Use this find a variation value from [dp]
  @protected
  double calcVariation(int dp) {
    return dp * variability;
  }

  /// Use this find a variation value from [dp] + [base]
  @protected
  double calcVariationWithBase(int dp) {
    return calcVariation(dp) + base;
  }

  /// Use this find a base value of current [context]
  @protected
  double get base {
    return brightness.isDark
        ? 0.0 + offset
        : 1.0 - offset - variability * (dpCount - 1);
  }

  /// Return [true] if [dp] value is valid
  bool isValidDp(int dp) => dp <= dpCount - 1;

  /// Func util to validate [dp] value, if is not valid,
  /// throws a [RangeError]
  @protected
  void validateDp(int dp) => isValidDp(dp)
      ? null
      : (() => throw RangeError.range(dp, 0, dpCount - 1))();

  /// Get a [HSLColor] from [dp]
  @protected
  HSLColor fromDp(int dp) {
    validateDp(dp);

    final lightness = calcVariationWithBase(dp);

    final hslColor = HSLColor.fromAHSL(
      1,
      baseHue ?? 0.0,
      isMonochrome ? 0.0 : saturation,
      lightness,
    );

    return hslColor;
  }
}
