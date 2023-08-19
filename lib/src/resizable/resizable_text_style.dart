import 'dart:math';
import 'dart:ui' as ui;

import 'package:breakpoints_utilities/breakpoints_utilities.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:meta/meta.dart';
import 'package:screen_size_provider/screen_size_provider.dart';

import '../func.dart';

class _ResizableTextStyleBuilder extends ResizableTextStyle {
  const _ResizableTextStyleBuilder({
    super.maxFont = ResizableTextStyle.kDefaultMaxFont,
    super.minFont = ResizableTextStyle.kDefaultMinFont,
    super.step = ResizableTextStyle.kDefaultStep,
    super.background,
    super.backgroundColor,
    super.color,
    super.debugLabel,
    super.decoration,
    super.decorationColor,
    super.decorationStyle,
    super.decorationThickness,
    super.fontFamily,
    super.fontFamilyFallback,
    super.fontFeatures,
    super.fontStyle,
    super.fontVariations,
    super.fontWeight,
    super.foreground,
    super.height,
    super.inherit,
    super.leadingDistribution,
    super.letterSpacing,
    super.locale,
    super.overflow,
    super.package,
    super.shadows,
    super.textBaseline,
    super.wordSpacing,
  }) : super._();
}

class _ResizableTextStyleFromOtherStyle extends ResizableTextStyle {
  const _ResizableTextStyleFromOtherStyle({
    required super.style,
    super.maxFont,
    super.step,
    super.minFont,
    super.package,
    super.fontFamilyFallback,
  }) : super._from();
}

class ResizableTextStyle extends TextStyle {
  /// Creates a [ResizableTextStyle] object.
  ///
  /// The [maxFont], [minFont], and [step] parameters define the resizable font
  /// size range and increment.
  ///
  /// The
  ///  - [backgroundColor],
  ///  - [color],
  ///  - [decorationColor],
  ///  - [fontStyle],
  ///  - [fontWeight],
  ///  - [fontFamilyFallback],
  ///  - [fontFeatures],
  ///  - [fontVariations],
  ///  - [shadows],
  ///  - [locale],
  ///  - [background],
  ///  - [foreground],
  ///  - [debugLabel],
  ///  - [fontFamily],
  ///  - [package],
  ///  - [textBaseline],
  ///  - [decoration],
  ///  - [decorationStyle],
  ///  - [overflow],
  ///  - [inherit],
  ///  - [decorationThickness],
  ///  - [height],
  ///  - [letterSpacing],
  ///  - [wordSpacing],
  ///  - [leadingDistribution]
  /// parameters correspond to the properties of the same name on [TextStyle].
  const factory ResizableTextStyle({
    final double maxFont,
    final double minFont,
    final double step,
    final Color? backgroundColor,
    final Color? color,
    final Color? decorationColor,
    final FontStyle? fontStyle,
    final FontWeight? fontWeight,
    final List<String>? fontFamilyFallback,
    final List<ui.FontFeature>? fontFeatures,
    final List<ui.FontVariation>? fontVariations,
    final List<ui.Shadow>? shadows,
    final Locale? locale,
    final Paint? background,
    final Paint? foreground,
    final String? debugLabel,
    final String? fontFamily,
    final String? package,
    final TextBaseline? textBaseline,
    final TextDecoration? decoration,
    final TextDecorationStyle? decorationStyle,
    final TextOverflow? overflow,
    final bool inherit,
    final double? decorationThickness,
    final double? height,
    final double? letterSpacing,
    final double? wordSpacing,
    final ui.TextLeadingDistribution? leadingDistribution,
  }) = _ResizableTextStyleBuilder;

  /// Creates a [ResizableTextStyle] object.
  ///
  /// The [minFont] parameter corresponds to the minimum font size.
  /// It must satisfy the condition: 0 < minFont.
  ///
  /// The [maxFont] parameter corresponds to the maximum font size.
  /// It must satisfy the condition: maxFont >= minFont.
  ///
  /// The [step] parameter corresponds to the step size for increasing
  /// or decreasing the font size. It must satisfy the condition: step > 0.
  /// If this condition is not true for your use case, use [Text] instead.
  const ResizableTextStyle._({
    required this.minFont,
    required this.maxFont,
    required this.step,
    super.background,
    super.backgroundColor,
    super.color,
    super.debugLabel,
    super.decoration,
    super.decorationColor,
    super.decorationStyle,
    super.decorationThickness,
    super.fontFamily,
    super.fontFamilyFallback,
    super.fontFeatures,
    super.fontStyle,
    super.fontVariations,
    super.fontWeight,
    super.foreground,
    super.height,
    super.inherit,
    super.leadingDistribution,
    super.letterSpacing,
    super.locale,
    super.overflow,
    super.package,
    super.shadows,
    super.textBaseline,
    super.wordSpacing,
  })  : assert(
          minFont > 0 && maxFont >= minFont,
          'Font boundaries must satisfy the condition: '
          '0 < minFont <= maxFont',
        ),
        assert(
          step > 0,
          'Step must satisfy the condition: step > 0. '
          'If this condition is not true for your use case, '
          'use Text instead.',
        ),
        _package = package,
        _fontFamilyFallback = fontFamilyFallback,
        _style = null,
        super(fontSize: null);

  /// Creates a [ResizableTextStyle] object from an existing [TextStyle].
  ///
  /// The [style] parameter is the [TextStyle] to base this
  /// [ResizableTextStyle] on.
  ///
  /// The [minFont], [maxFont], [step], [package], and [fontFamilyFallback]
  /// parameters correspond to the properties of the same name on
  /// [ResizableTextStyle].
  const ResizableTextStyle._from({
    required final TextStyle style,
    this.minFont = ResizableTextStyle.kDefaultMinFont,
    this.maxFont = ResizableTextStyle.kDefaultMaxFont,
    this.step = ResizableTextStyle.kDefaultStep,
    final String? package,
    final List<String>? fontFamilyFallback,
  })  : assert(
          minFont > 0 && maxFont >= minFont,
          'Font boundaries must satisfy the condition: '
          '0 < minFont <= maxFont',
        ),
        assert(
          step > 0,
          'Step must satisfy the condition: step > 0. '
          'If this condition is not true for your use case, '
          'use Text instead.',
        ),
        _package = package,
        _fontFamilyFallback = fontFamilyFallback,
        _style = style,
        super(fontSize: null);

  /// Creates a [ResizableTextStyle] object from an existing [TextStyle].
  ///
  /// The [style] parameter is the [TextStyle] to base this
  /// [ResizableTextStyle] on.
  ///
  /// The [minFont], [maxFont], [step], [package], and [fontFamilyFallback]
  /// parameters correspond to the properties of the same name on
  /// [ResizableTextStyle].
  const factory ResizableTextStyle.from({
    required final TextStyle style,
    final double minFont,
    final double maxFont,
    final double step,
    final String? package,
    final List<String>? fontFamilyFallback,
  }) = _ResizableTextStyleFromOtherStyle;

  /// Creates a [ResizableTextStyle] object from an existing
  /// [ResizableTextStyle].
  ///
  /// The [style] parameter is the [ResizableTextStyle] to base this
  /// [ResizableTextStyle] on.
  ///
  /// The [fontSize] parameter is the initial font size for this style. As the
  /// screen width changes, the font size will be recalculated based on
  /// [minFont], [maxFont], and [step].
  ///
  /// The [minFont] parameter is the minimum font size this style can have.
  ///
  /// The [maxFont] parameter is the maximum font size this style can have.
  ///
  /// The [step] parameter is the increment that will be used to recalculate the
  /// font size as the screen width changes.
  ///
  /// The [package] and [fontFamilyFallback] parameters correspond to the
  /// properties of the same name on [TextStyle].
  const ResizableTextStyle._withFontSize({
    required final ResizableTextStyle style,
    required super.fontSize,
    required this.maxFont,
    required this.step,
    required this.minFont,
    super.package,
    super.fontFamilyFallback,
  })  : _style = style,
        _package = package,
        _fontFamilyFallback = fontFamilyFallback,
        super();

  /// The [TextStyle] that this [ResizableTextStyle] is based on.
  ///
  /// If a property is not explicitly set on this [ResizableTextStyle], it will
  /// default to the corresponding property on [_style].
  final TextStyle? _style;

  /// Calculates the font size based on the screen width and resizable text
  /// style parameters.
  ///
  /// The [minFont] parameter is the minimum font size allowed.
  ///
  /// The [maxFont] parameter is the maximum font size allowed.
  ///
  /// The [step] parameter is the increment that will be used to increase the
  /// font size as the screen width increases.
  ///
  /// The [breakpoint] parameter is the current screen width. The font size will
  /// increase by [step] for every [breakpoint] units of width.
  ///
  /// For example, if [minFont] is 12, [maxFont] is 24, [step] is
  /// 0.00026041666667 (the default), and [breakpoint] is 800:
  /// - At 0 width, the font size will be 12 (min)
  /// - At 400 width, the font size will be 12 * ((400 * step) + 1) = 13.25
  /// - At 800 width, the font size will be 12 * ((800 * step) + 1) = 14.5
  /// - At 1200 width, the font size will be 12 * ((1200 * step) + 1) = 15.75
  /// - At 1600 width, the font size will be 12 * ((1600 * step) + 1) = 17
  /// - At 4000 width, the font size will be 24 (max)
  ///
  /// The calculated font size will always be between [minFont] and [maxFont].
  static double _calcFontSize({
    required final double minFont,
    required final double maxFont,
    required final double step,
    required final int breakpoint,
  }) =>
      min(
        max(
          minFont * ((breakpoint * step) + 1),
          minFont,
        ),
        maxFont,
      );

  @override
  double get fontSize =>
      super.fontSize ??
      _calcFontSize(
        minFont: minFont,
        maxFont: maxFont,
        step: step,
        breakpoint: ScreenSizeProvider.width,
      );

  @override
  List<String>? get fontFamilyFallback =>
      _style?.fontFamilyFallback ?? super.fontFamilyFallback;

  @override
  bool get inherit => _style?.inherit ?? super.inherit;

  @override
  Color? get color => _style?.color ?? super.color;

  @override
  Color? get backgroundColor =>
      _style?.backgroundColor ?? super.backgroundColor;

  @override
  String? get fontFamily => _style?.fontFamily ?? super.fontFamily;

  @override
  FontWeight get fontWeight =>
      _style?.fontWeight ?? super.fontWeight ?? kDefaultWeight;

  @override
  FontStyle? get fontStyle => _style?.fontStyle ?? super.fontStyle;

  @override
  double get letterSpacing =>
      _style?.letterSpacing ?? super.letterSpacing ?? kDefaultLetterSpacing;

  @override
  double? get wordSpacing => _style?.wordSpacing ?? super.wordSpacing;

  @override
  TextBaseline? get textBaseline => _style?.textBaseline ?? super.textBaseline;

  @override
  double? get height => _style?.height ?? super.height;

  @override
  ui.TextLeadingDistribution? get leadingDistribution =>
      _style?.leadingDistribution ?? super.leadingDistribution;

  @override
  Locale? get locale => _style?.locale ?? super.locale;

  @override
  Paint? get foreground => _style?.foreground ?? super.foreground;

  @override
  Paint? get background => _style?.background ?? super.background;

  @override
  TextDecoration? get decoration => _style?.decoration ?? super.decoration;

  @override
  Color? get decorationColor =>
      _style?.decorationColor ?? super.decorationColor;

  @override
  TextDecorationStyle? get decorationStyle =>
      _style?.decorationStyle ?? super.decorationStyle;

  @override
  double? get decorationThickness =>
      _style?.decorationThickness ?? super.decorationThickness;

  @override
  String? get debugLabel => _style?.debugLabel ?? super.debugLabel;

  @override
  List<ui.Shadow>? get shadows => _style?.shadows ?? super.shadows;

  @override
  List<ui.FontFeature>? get fontFeatures =>
      _style?.fontFeatures ?? super.fontFeatures;

  @override
  List<ui.FontVariation>? get fontVariations =>
      _style?.fontVariations ?? super.fontVariations;

  @override
  TextOverflow get overflow =>
      _style?.overflow ?? super.overflow ?? kDefaultOverflow;

  /// [minFont] -> Minimum font size. Defaults to 12px.
  final double minFont;

  /// [maxFont] -> Maximum font size. Defaults to 24px.
  final double maxFont;

  /// The amount of px the font size should transition per 1px screen
  /// width transition. Defaults to 0.00026041666667, which produces
  /// the 1.5x font size of [minFont] at 1920px (FHD). For example, if the
  /// provided [minFont] is 16px, then at a screen width of 1920px, the text
  /// font size would be 24px. Equivalently, with [minFont] = 16px, the font
  /// size at different breakpoints would be:
  /// - 0px:    16px
  /// - 60px:   16.25px
  /// - 80px:   16.333333333px
  /// - 120px:  16.5px
  /// - 180px:  16.75px
  /// - 240px:  17px
  /// - 300px:  17.25px
  /// - 320px:  17.333333333px
  /// - 360px:  17.5px
  /// - 480px:  18px
  /// - 540px:  18.25px
  /// - 630px:  18.625px
  /// - 680px:  18.833333333px
  /// - 720px:  19px
  /// - 767px:  19.195833333px
  /// - 968px:  20.033333333px
  /// - 1040px: 20.333333333px
  /// - 1080px: 20.5px
  /// - 1200px: 21px
  /// - 1260px: 21.25px
  /// - 1440px: 22px
  /// - 1880px: 23.833333333px
  /// - 1920px: 24px
  ///
  /// Using a different step from the default will produce other results that
  /// may suit your needs better. For example, if you need more noticeable
  /// changes, you can up the step. To make the font grow bigger, faster.
  ///
  /// The results are pre-calculated with 9 digits precision, which is the best
  /// a basic home calculator can do, and probably more than enough for the
  /// problem domain.
  final double step;

  /// The package this font is from. Used to strip the "packages/$_package/"
  /// prefix from [fontFamily].
  final String? _package;

  /// Fallback font families to use if the [fontFamily] cannot be loaded.
  final List<String>? _fontFamilyFallback;

  /// The default debug label used if none is provided.
  static const String kDefaultDebugLabel = 'unknown';

  /// Warning if both [color] and [foreground] are provided. [color] is a
  /// shorthand for "foreground: Paint()..color = color".
  static const String kColorForegroundWarning =
      'Cannot provide both a color and a foreground\n'
      'The color argument is just a shorthand for '
      '"foreground: Paint()..color = color".';

  /// Warning if both [backgroundColor] and [background] are provided.
  /// [backgroundColor] is a shorthand for "background: Paint()..color = color".
  static const String kColorBackgroundWarning =
      'Cannot provide both a backgroundColor and a background\n'
      'The backgroundColor argument is just a shorthand for '
      '"background: Paint()..color = color".';

  /// The default font size step. Produces 1.5x [minFont] at 1920px (FHD) screen
  /// width.
  static const double kDefaultStep = 0.00026041666667;

  /// The default minimum font size.
  static const double kDefaultMinFont = 12;

  /// The default maximum font size.
  static const double kDefaultMaxFont = 24;

  /// The default font weight.
  static const FontWeight kDefaultWeight = FontWeight.w400;

  /// The default letter spacing.
  static const double kDefaultLetterSpacing = 1;

  /// The default text overflow behavior.
  static const TextOverflow kDefaultOverflow = TextOverflow.ellipsis;

  // Return the original value of fontFamily, without the additional
  // "packages/$_package/" prefix.
  String? get _fontFamily {
    if (_package != null) {
      final String fontFamilyPrefix = 'packages/$_package/';
      assert(
        fontFamily?.startsWith(fontFamilyPrefix) ?? true,
        'Invalid package font family prefix.',
      );
      return fontFamily?.substring(fontFamilyPrefix.length);
    }
    return fontFamily;
  }

  @override
  ResizableTextStyle copyWith({
    final bool? inherit,
    final Color? color,
    final Color? backgroundColor,
    final double? fontSize,
    final double? minFont,
    final double? maxFont,
    final double? step,
    final FontWeight? fontWeight,
    final FontStyle? fontStyle,
    final double? letterSpacing,
    final double? wordSpacing,
    final TextBaseline? textBaseline,
    final double? height,
    final ui.TextLeadingDistribution? leadingDistribution,
    final Locale? locale,
    final Paint? foreground,
    final Paint? background,
    final List<ui.Shadow>? shadows,
    final List<ui.FontFeature>? fontFeatures,
    final List<ui.FontVariation>? fontVariations,
    final TextDecoration? decoration,
    final Color? decorationColor,
    final TextDecorationStyle? decorationStyle,
    final double? decorationThickness,
    final String? debugLabel,
    final String? fontFamily,
    final List<String>? fontFamilyFallback,
    final String? package,
    final TextOverflow? overflow,
  }) {
    assert(color == null || foreground == null, kColorForegroundWarning);
    assert(
      backgroundColor == null || background == null,
      kColorBackgroundWarning,
    );
    String? newDebugLabel;
    if (kDebugMode) {
      if (this.debugLabel != null) {
        newDebugLabel = debugLabel ?? '(${this.debugLabel}).copyWith';
      }
    }

    return ResizableTextStyle(
      inherit: inherit ?? this.inherit,
      color: this.foreground == null && foreground == null
          ? color ?? this.color
          : null,
      backgroundColor: this.background == null && background == null
          ? backgroundColor ?? this.backgroundColor
          : null,
      minFont: minFont ?? this.minFont,
      maxFont: maxFont ?? this.maxFont,
      step: step ?? this.step,
      fontWeight: fontWeight ?? this.fontWeight,
      fontStyle: fontStyle ?? this.fontStyle,
      letterSpacing: letterSpacing ?? this.letterSpacing,
      wordSpacing: wordSpacing ?? this.wordSpacing,
      textBaseline: textBaseline ?? this.textBaseline,
      height: height ?? this.height,
      leadingDistribution: leadingDistribution ?? this.leadingDistribution,
      locale: locale ?? this.locale,
      foreground: foreground ?? this.foreground,
      background: background ?? this.background,
      shadows: shadows ?? this.shadows,
      fontFeatures: fontFeatures ?? this.fontFeatures,
      fontVariations: fontVariations ?? this.fontVariations,
      decoration: decoration ?? this.decoration,
      decorationColor: decorationColor ?? this.decorationColor,
      decorationStyle: decorationStyle ?? this.decorationStyle,
      decorationThickness: decorationThickness ?? this.decorationThickness,
      debugLabel: newDebugLabel,
      fontFamily: fontFamily ?? _fontFamily,
      fontFamilyFallback: fontFamilyFallback ?? _fontFamilyFallback,
      package: package ?? _package,
      overflow: overflow ?? this.overflow,
    );
  }

  @override
  ResizableTextStyle apply({
    final Color? backgroundColor,
    final Color? color,
    final Color? decorationColor,
    final FontStyle? fontStyle,
    final List<String>? fontFamilyFallback,
    final List<ui.FontFeature>? fontFeatures,
    final List<ui.FontVariation>? fontVariations,
    final List<ui.Shadow>? shadows,
    final Locale? locale,
    final String? fontFamily,
    final String? package,
    final TextBaseline? textBaseline,
    final TextDecoration? decoration,
    final TextDecorationStyle? decorationStyle,
    final TextOverflow? overflow,
    final double decorationThicknessDelta = 0.0,
    final double decorationThicknessFactor = 1.0,
    final double fontSizeDelta = 0.0,
    final double fontSizeFactor = 1.0,
    final double minFontDelta = 0.0,
    final double minFontFactor = 1.0,
    final double maxFontDelta = 0.0,
    final double maxFontFactor = 1.0,
    final double stepDelta = 0.0,
    final double stepFactor = 1.0,
    final double heightDelta = 0.0,
    final double heightFactor = 1.0,
    final double letterSpacingDelta = 0.0,
    final double letterSpacingFactor = 1.0,
    final double wordSpacingDelta = 0.0,
    final double wordSpacingFactor = 1.0,
    final int fontWeightDelta = 0,
    final ui.TextLeadingDistribution? leadingDistribution,
  }) {
    assert(
      fontWeightDelta == 0.0,
      'fontWeightDelta cannot be applied when no fontWeight is provided.',
    );
    assert(
      letterSpacingFactor == 1.0 && letterSpacingDelta == 0.0,
      'If letterSpacing is not specified, then letterSpacingFactor must be '
      'set to 1.0 and letterSpacingDelta to 0.0.',
    );
    assert(
      wordSpacing != null ||
          (wordSpacingFactor == 1.0 && wordSpacingDelta == 0.0),
      'If wordSpacing is not specified, then wordSpacingFactor must be set '
      'to 1.0 and wordSpacingDelta to 0.0.',
    );
    assert(
      decorationThickness != null ||
          (decorationThicknessFactor == 1.0 && decorationThicknessDelta == 0.0),
      'If decorationThickness is not specified, then '
      'decorationThicknessFactor must be set to 1.0 and '
      'decorationThicknessDelta to 0.0.',
    );

    String? modifiedDebugLabel;
    if (kDebugMode) {
      if (debugLabel != null) {
        modifiedDebugLabel = '($debugLabel).apply';
      }
    }

    return ResizableTextStyle(
      background: background,
      backgroundColor: produceT1fromT2orNull<Color?, Paint?>(
        (final _) => backgroundColor ?? this.backgroundColor,
        background,
      ),
      color: produceT1fromT2orNull<Color?, Paint?>(
        (final _) => color ?? this.color,
        foreground,
      ),
      debugLabel: modifiedDebugLabel,
      decoration: decoration ?? this.decoration,
      decorationColor: decorationColor ?? this.decorationColor,
      decorationStyle: decorationStyle ?? this.decorationStyle,
      decorationThickness: produceValOrNull<double>(
        (final double thickness) {
          final double factor = thickness * decorationThicknessFactor;
          return factor + decorationThicknessDelta;
        },
        decorationThickness,
      ),
      fontFamily: fontFamily ?? _fontFamily,
      fontFamilyFallback: fontFamilyFallback ?? _fontFamilyFallback,
      fontFeatures: fontFeatures ?? this.fontFeatures,
      fontStyle: fontStyle ?? this.fontStyle,
      fontVariations: fontVariations ?? this.fontVariations,
      fontWeight: produceValOrNull<FontWeight>(
        (final FontWeight weight) {
          final int iVal = weight.index + fontWeightDelta;
          final int index = iVal.clamp(0, FontWeight.values.length - 1);
          return FontWeight.values[index];
        },
        fontWeight,
      ), // ignore_clamp_double_lint
      foreground: foreground,
      height: produceValOrNull<double>(
        (final double h) => h * heightFactor + heightDelta,
        height,
      ),
      inherit: inherit,
      leadingDistribution: leadingDistribution ?? this.leadingDistribution,
      letterSpacing: produceValOrNull<double>(
        (final double s) => s * letterSpacingFactor + letterSpacingDelta,
        letterSpacing,
      ),
      locale: locale ?? this.locale,
      overflow: overflow ?? this.overflow,
      package: package ?? _package,
      shadows: shadows ?? this.shadows,
      textBaseline: textBaseline ?? this.textBaseline,
      wordSpacing: produceValOrNull<double>(
        (final double s) => s * wordSpacingFactor + wordSpacingDelta,
        wordSpacing,
      ),
      minFont: minFont * minFontFactor + minFontDelta,
      maxFont: maxFont * maxFontFactor + maxFontDelta,
      step: step * stepFactor + stepDelta,
    );
  }

  @override
  ResizableTextStyle merge(final TextStyle? other) {
    if (other == null) {
      return this;
    }
    if (!other.inherit) {
      if (other is ResizableTextStyle) {
        return other;
      }
      return ResizableTextStyle.from(style: other);
    }

    String? mergedDebugLabel;
    if (kDebugMode) {
      if (other.debugLabel != null || debugLabel != null) {
        mergedDebugLabel = '(${debugLabel ?? kDefaultDebugLabel}).merge('
            '${other.debugLabel ?? kDefaultDebugLabel})';
      }
    }

    if (other is ResizableTextStyle) {
      return copyWith(
        color: other.color,
        backgroundColor: other.backgroundColor,
        fontSize: other.fontSize,
        fontWeight: other.fontWeight,
        fontStyle: other.fontStyle,
        letterSpacing: other.letterSpacing,
        wordSpacing: other.wordSpacing,
        textBaseline: other.textBaseline,
        height: other.height,
        leadingDistribution: other.leadingDistribution,
        locale: other.locale,
        foreground: other.foreground,
        background: other.background,
        shadows: other.shadows,
        fontFeatures: other.fontFeatures,
        fontVariations: other.fontVariations,
        decoration: other.decoration,
        decorationColor: other.decorationColor,
        decorationStyle: other.decorationStyle,
        decorationThickness: other.decorationThickness,
        debugLabel: mergedDebugLabel,
        fontFamily: other._fontFamily,
        minFont: other.minFont,
        maxFont: other.maxFont,
        step: other.step,
        fontFamilyFallback: other._fontFamilyFallback,
        package: other._package,
        overflow: other.overflow,
      );
    }

    return copyWith(
      color: other.color,
      backgroundColor: other.backgroundColor,
      fontSize: other.fontSize,
      fontWeight: other.fontWeight,
      fontStyle: other.fontStyle,
      letterSpacing: other.letterSpacing,
      wordSpacing: other.wordSpacing,
      textBaseline: other.textBaseline,
      height: other.height,
      leadingDistribution: other.leadingDistribution,
      locale: other.locale,
      foreground: other.foreground,
      background: other.background,
      shadows: other.shadows,
      fontFeatures: other.fontFeatures,
      fontVariations: other.fontVariations,
      decoration: other.decoration,
      decorationColor: other.decorationColor,
      decorationStyle: other.decorationStyle,
      decorationThickness: other.decorationThickness,
      debugLabel: mergedDebugLabel,
      fontFamily: other.fontFamily,
      fontFamilyFallback: other.fontFamilyFallback,
      overflow: other.overflow,
    );
  }

  /// Fill in any null property of this style with the non-null property of the
  /// [other] style.
  ResizableTextStyle reverseMerge(final TextStyle? other) {
    if (other == null) {
      return copyWith();
    }

    if (other is ResizableTextStyle) {
      return other.merge(this);
    }

    return ResizableTextStyle.from(
      style: other,
      fontFamilyFallback: other.fontFamilyFallback,
    ).merge(this);
  }

  static ResizableTextStyle? lerp(
    final ResizableTextStyle? a,
    final ResizableTextStyle? b,
    final double t,
  ) {
    if (a == null && b == null) {
      return null;
    }

    String? lerpDebugLabel;
    if (kDebugMode) {
      lerpDebugLabel = 'lerp(${a?.debugLabel ?? kDefaultDebugLabel} '
          '⎯${t.toStringAsFixed(1)}→ ${b?.debugLabel ?? kDefaultDebugLabel})';
    }

    if (a == null) {
      return ResizableTextStyle(
        inherit: b!.inherit,
        color: Color.lerp(null, b.color, t),
        backgroundColor: Color.lerp(null, b.backgroundColor, t),
        minFont: b.minFont,
        maxFont: b.maxFont,
        step: b.step,
        fontWeight: FontWeight.lerp(null, b.fontWeight, t),
        fontStyle: t < 0.5 ? null : b.fontStyle,
        letterSpacing: t < 0.5 ? null : b.letterSpacing,
        wordSpacing: t < 0.5 ? null : b.wordSpacing,
        textBaseline: t < 0.5 ? null : b.textBaseline,
        height: t < 0.5 ? null : b.height,
        leadingDistribution: t < 0.5 ? null : b.leadingDistribution,
        locale: t < 0.5 ? null : b.locale,
        foreground: t < 0.5 ? null : b.foreground,
        background: t < 0.5 ? null : b.background,
        shadows: t < 0.5 ? null : b.shadows,
        fontFeatures: t < 0.5 ? null : b.fontFeatures,
        fontVariations: t < 0.5 ? null : b.fontVariations,
        decoration: t < 0.5 ? null : b.decoration,
        decorationColor: Color.lerp(null, b.decorationColor, t),
        decorationStyle: t < 0.5 ? null : b.decorationStyle,
        decorationThickness: t < 0.5 ? null : b.decorationThickness,
        debugLabel: lerpDebugLabel,
        fontFamily: t < 0.5 ? null : b._fontFamily,
        fontFamilyFallback: t < 0.5 ? null : b._fontFamilyFallback,
        package: t < 0.5 ? null : b._package,
        overflow: b.overflow,
      );
    }

    if (b == null) {
      return ResizableTextStyle(
        inherit: a.inherit,
        color: Color.lerp(a.color, null, t),
        backgroundColor: Color.lerp(null, a.backgroundColor, t),
        minFont: a.minFont,
        maxFont: a.maxFont,
        step: a.step,
        fontWeight: FontWeight.lerp(a.fontWeight, null, t),
        fontStyle: t < 0.5 ? a.fontStyle : null,
        letterSpacing: t < 0.5 ? a.letterSpacing : null,
        wordSpacing: t < 0.5 ? a.wordSpacing : null,
        textBaseline: t < 0.5 ? a.textBaseline : null,
        height: t < 0.5 ? a.height : null,
        leadingDistribution: t < 0.5 ? a.leadingDistribution : null,
        locale: t < 0.5 ? a.locale : null,
        foreground: t < 0.5 ? a.foreground : null,
        background: t < 0.5 ? a.background : null,
        shadows: t < 0.5 ? a.shadows : null,
        fontFeatures: t < 0.5 ? a.fontFeatures : null,
        fontVariations: t < 0.5 ? a.fontVariations : null,
        decoration: t < 0.5 ? a.decoration : null,
        decorationColor: Color.lerp(a.decorationColor, null, t),
        decorationStyle: t < 0.5 ? a.decorationStyle : null,
        decorationThickness: t < 0.5 ? a.decorationThickness : null,
        debugLabel: lerpDebugLabel,
        fontFamily: t < 0.5 ? a._fontFamily : null,
        fontFamilyFallback: t < 0.5 ? a._fontFamilyFallback : null,
        package: t < 0.5 ? a._package : null,
        overflow: a.overflow,
      );
    }

    // ignore: prefer_asserts_with_message
    assert(
      () {
        if (a.inherit == b.inherit) {
          return true;
        }

        final bool hasColor =
            (a.foreground ?? b.foreground ?? a.color ?? b.color) != null;
        final bool hasBackground = (a.background ??
                b.background ??
                a.backgroundColor ??
                b.backgroundColor) !=
            null;
        final bool hasWordSpacing = (a.wordSpacing ?? b.wordSpacing) != null;
        final bool hasHeight = (a.height ?? b.height) != null;
        final bool hasDecorationColor =
            (a.decorationColor ?? b.decorationColor) != null;
        final bool hasDecorationThickness =
            (a.decorationThickness ?? b.decorationThickness) != null;
        final List<String> nullFields = <String>[
          if (!hasColor) 'color',
          if (!hasBackground) 'backgroundColor',
          if (!hasWordSpacing) 'wordSpacing',
          if (!hasHeight) 'height',
          if (!hasDecorationColor) 'decorationColor',
          if (!hasDecorationThickness) 'decorationThickness',
        ];
        if (nullFields.isEmpty) {
          return true;
        }

        throw FlutterError.fromParts(
          <DiagnosticsNode>[
            ErrorSummary(
              'Failed to interpolate TextStyles with different inherit values.',
            ),
            ErrorSpacer(),
            ErrorDescription('The TextStyles being interpolated were:'),
            a.toDiagnosticsNode(
              name: 'from',
              style: DiagnosticsTreeStyle.singleLine,
            ),
            b.toDiagnosticsNode(
              name: 'to',
              style: DiagnosticsTreeStyle.singleLine,
            ),
            ErrorDescription(
              'The following fields are unspecified in both TextStyles:\n'
              '${nullFields.map((final String name) => '"$name"').join(', ')}.'
              '\nWhen "inherit" changes during the transition, these fields '
              'may observe abrupt value changes as a result, causing "jump"s '
              'in the transition.',
            ),
            ErrorSpacer(),
            ErrorHint(
              'In general, TextStyle.lerp only works well when both TextStyles '
              'have the same "inherit" value, and specify the same fields.',
            ),
            ErrorHint(
              'If the TextStyles were directly created by you, consider '
              'bringing them to parity to ensure a smooth transition.',
            ),
            ErrorSpacer(),
            ErrorHint(
              'If one of the TextStyles being lerped is significantly more '
              'elaborate than the other, and has "inherited" set to false, it '
              'is often because it is merged with another TextStyle before '
              'being lerped. Comparing the "debugLabel"s of the two TextStyles '
              'may help identify if that was the case.',
            ),
            ErrorHint(
              'For example, you may see this error message when trying to lerp '
              'between "ThemeData()" and "Theme.of(context)". This is because '
              'TextStyles from "Theme.of(context)" are merged with TextStyles '
              'from another theme and thus are more elaborate than the '
              'TextStyles from "ThemeData()" (which is reflected in their '
              '"debugLabel"s -- TextStyles from "Theme.of(context)" should '
              'have labels in the form of "(<A TextStyle>).merge(<Another '
              'TextStyle>)"). It is recommended to only lerp ThemeData with '
              'matching TextStyles.',
            ),
          ],
        );
      }(),
    );

    return ResizableTextStyle(
      inherit: t < 0.5 ? a.inherit : b.inherit,
      color: a.foreground == null && b.foreground == null
          ? Color.lerp(a.color, b.color, t)
          : null,
      backgroundColor: a.background == null && b.background == null
          ? Color.lerp(a.backgroundColor, b.backgroundColor, t)
          : null,
      minFont: ui.lerpDouble(a.minFont, b.minFont, t) ?? a.minFont,
      maxFont: ui.lerpDouble(a.maxFont, b.maxFont, t) ?? a.maxFont,
      step: ui.lerpDouble(a.step, b.step, t) ?? a.step,
      fontWeight: FontWeight.lerp(a.fontWeight, b.fontWeight, t),
      fontStyle: t < 0.5 ? a.fontStyle : b.fontStyle,
      letterSpacing: ui.lerpDouble(a.letterSpacing, b.letterSpacing, t),
      wordSpacing: ui.lerpDouble(
        a.wordSpacing ?? b.wordSpacing,
        b.wordSpacing ?? a.wordSpacing,
        t,
      ),
      textBaseline: t < 0.5 ? a.textBaseline : b.textBaseline,
      height: ui.lerpDouble(a.height ?? b.height, b.height ?? a.height, t),
      leadingDistribution:
          t < 0.5 ? a.leadingDistribution : b.leadingDistribution,
      locale: t < 0.5 ? a.locale : b.locale,
      foreground: (a.foreground != null || b.foreground != null)
          ? t < 0.5
              ? a.foreground ?? (Paint()..color = a.color!)
              : b.foreground ?? (Paint()..color = b.color!)
          : null,
      background: (a.background != null || b.background != null)
          ? t < 0.5
              ? a.background ?? (Paint()..color = a.backgroundColor!)
              : b.background ?? (Paint()..color = b.backgroundColor!)
          : null,
      shadows: t < 0.5 ? a.shadows : b.shadows,
      fontFeatures: t < 0.5 ? a.fontFeatures : b.fontFeatures,
      fontVariations: t < 0.5 ? a.fontVariations : b.fontVariations,
      decoration: t < 0.5 ? a.decoration : b.decoration,
      decorationColor: Color.lerp(a.decorationColor, b.decorationColor, t),
      decorationStyle: t < 0.5 ? a.decorationStyle : b.decorationStyle,
      decorationThickness: ui.lerpDouble(
        a.decorationThickness ?? b.decorationThickness,
        b.decorationThickness ?? a.decorationThickness,
        t,
      ),
      debugLabel: lerpDebugLabel,
      fontFamily: t < 0.5 ? a._fontFamily : b._fontFamily,
      fontFamilyFallback:
          t < 0.5 ? a._fontFamilyFallback : b._fontFamilyFallback,
      package: t < 0.5 ? a._package : b._package,
      overflow: t < 0.5 ? a.overflow : b.overflow,
    );
  }

  @override
  RenderComparison compareTo(final TextStyle other) {
    if (identical(this, other)) {
      return RenderComparison.identical;
    }
    if (inherit != other.inherit ||
        fontFamily != other.fontFamily ||
        fontSize != other.fontSize ||
        fontWeight != other.fontWeight ||
        fontStyle != other.fontStyle ||
        letterSpacing != other.letterSpacing ||
        wordSpacing != other.wordSpacing ||
        textBaseline != other.textBaseline ||
        height != other.height ||
        leadingDistribution != other.leadingDistribution ||
        locale != other.locale ||
        foreground != other.foreground ||
        background != other.background ||
        !listEquals(shadows, other.shadows) ||
        !listEquals(fontFeatures, other.fontFeatures) ||
        !listEquals(fontVariations, other.fontVariations) ||
        !listEquals(fontFamilyFallback, other.fontFamilyFallback) ||
        overflow != other.overflow) {
      return RenderComparison.layout;
    }
    if (other is ResizableTextStyle) {
      if (minFont != other.minFont ||
          maxFont != other.maxFont ||
          step != other.step) {
        return RenderComparison.layout;
      }
    }
    if (color != other.color ||
        backgroundColor != other.backgroundColor ||
        decoration != other.decoration ||
        decorationColor != other.decorationColor ||
        decorationStyle != other.decorationStyle ||
        decorationThickness != other.decorationThickness) {
      return RenderComparison.paint;
    }
    return RenderComparison.identical;
  }

  @override
  bool operator ==(final Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is ResizableTextStyle &&
        other.inherit == inherit &&
        other.color == color &&
        other.backgroundColor == backgroundColor &&
        other.fontSize == fontSize &&
        other.minFont == minFont &&
        other.maxFont == maxFont &&
        other.step == step &&
        other.fontWeight == fontWeight &&
        other.fontStyle == fontStyle &&
        other.letterSpacing == letterSpacing &&
        other.wordSpacing == wordSpacing &&
        other.textBaseline == textBaseline &&
        other.height == height &&
        other.leadingDistribution == leadingDistribution &&
        other.locale == locale &&
        other.foreground == foreground &&
        other.background == background &&
        listEquals(other.shadows, shadows) &&
        listEquals(other.fontFeatures, fontFeatures) &&
        listEquals(other.fontVariations, fontVariations) &&
        other.decoration == decoration &&
        other.decorationColor == decorationColor &&
        other.decorationStyle == decorationStyle &&
        other.decorationThickness == decorationThickness &&
        other.fontFamily == fontFamily &&
        listEquals(other.fontFamilyFallback, fontFamilyFallback) &&
        other._package == _package &&
        other.overflow == overflow;
  }

  @override
  int get hashCode {
    final List<String>? fontFamilyFallback = this.fontFamilyFallback;
    final int fontHash = Object.hash(
      decorationStyle,
      decorationThickness,
      fontFamily,
      fontFamilyFallback == null ? null : Object.hashAll(fontFamilyFallback),
      _package,
      overflow,
    );

    final List<ui.Shadow>? shadows = this.shadows;
    final List<ui.FontFeature>? fontFeatures = this.fontFeatures;
    final List<ui.FontVariation>? fontVariations = this.fontVariations;
    return Object.hash(
      inherit,
      color,
      backgroundColor,
      Object.hashAll(
        <double?>[
          fontSize,
          minFont,
          maxFont,
          step,
        ],
      ),
      fontWeight,
      fontStyle,
      letterSpacing,
      wordSpacing,
      textBaseline,
      height,
      leadingDistribution,
      locale,
      foreground,
      background,
      shadows == null ? null : Object.hashAll(shadows),
      fontFeatures == null ? null : Object.hashAll(fontFeatures),
      fontVariations == null ? null : Object.hashAll(fontVariations),
      decoration,
      decorationColor,
      fontHash,
    );
  }

  @override
  String toStringShort() => objectRuntimeType(this, 'ResizableTextStyle');

  /// Debugging function that prints the results of different configurations
  /// for different [breakpoints]. Can be used to test different combinations of
  /// [minFont], [maxFont], and [step].
  static void debugPrintFontAtBreakpoints({
    final double minFont = kDefaultMinFont,
    final double maxFont = kDefaultMaxFont,
    final double step = kDefaultStep,
    final List<PredefinedBreakpoint> breakpoints = PredefinedBreakpoint.values,
  }) {
    assert(
      breakpoints.isNotEmpty,
      throw Exception('Breakpoints cannot be an empty list.'),
    );
    assert(
      minFont > 0 && maxFont >= minFont,
      throw Exception(
        'Font boundaries must satisfy the condition: 0 < minFont <= maxFont',
      ),
    );
    assert(
      step > 0,
      throw Exception(
        'Step must satisfy the condition: step > 0. '
        'If this condition is not true for your use case, use Text instead.',
      ),
    );
    if (kDebugMode) {
      for (final PredefinedBreakpoint breakpoint in breakpoints..sort()) {
        print(
          'Breakpoint: $breakpoint, '
          'size: ${_calcFontSize(
            minFont: minFont,
            maxFont: maxFont,
            step: step,
            breakpoint: breakpoint.model.begin.toInt(),
          )}',
        );
      }
    }
  }

  /// Debugging function that prints the current [fontSize].
  void debugPrintFont() {
    if (kDebugMode) {
      print(
        'Breakpoint: ${ScreenSizeProvider.width}, '
        'size: ${_calcFontSize(
          minFont: minFont,
          maxFont: maxFont,
          step: step,
          breakpoint: ScreenSizeProvider.width,
        )}',
      );
    }
  }

  @override
  void debugFillProperties(
    final DiagnosticPropertiesBuilder properties, {
    final String prefix = '',
  }) {
    super.debugFillProperties(properties, prefix: prefix);
    properties
      ..add(DoubleProperty('maxFont', maxFont))
      ..add(DoubleProperty('step', step))
      ..add(DoubleProperty('minFont', minFont));
  }
}

@internal
extension PrivatePackageMethods on ResizableTextStyle {
  /// Creates a new [ResizableTextStyle] instance with the given font size.
  ///
  /// The [style] parameter is the base [ResizableTextStyle] to modify.
  ///
  /// The [fontSize] is the font size to set.
  ///
  /// The [maxFont] is the maximum font size. As the screen width increases, the
  /// font size will increase until it reaches this maximum.
  ///
  /// The [step] is the increment to increase the font size by for each
  /// breakpoint.
  ///
  /// The [minFont] is the minimum font size. As the screen width decreases, the
  /// font size will decrease until it reaches this minimum.
  ///
  /// The [package] is the package this text style belongs to. This is used to
  /// scope the text style to a specific package.
  ///
  /// The [fontFamilyFallback] is the list of font families to use as fallbacks
  /// if the primary font is not available.
  ///
  /// Returns a new [ResizableTextStyle] instance with the given parameters.
  static ResizableTextStyle withFontSize({
    required final ResizableTextStyle style,
    required final double fontSize,
    required final double maxFont,
    required final double step,
    required final double minFont,
    final String? package,
    final List<String>? fontFamilyFallback,
  }) =>
      ResizableTextStyle._withFontSize(
        style: style,
        fontSize: fontSize,
        maxFont: maxFont,
        step: step,
        minFont: minFont,
      );

  /// The package this text style belongs to. Used to scope the text style to a
  /// specific package.
  String? get package => _package;

  /// The base [TextStyle] of this [ResizableTextStyle].
  TextStyle? get style => _style;

  /// The list of font families to use as fallbacks if the primary font is not
  /// available.
  List<String>? get fontFamilyFallback => _fontFamilyFallback;

  /// Calculates the font size for the given [breakpoint] based on the
  /// [minFont], [maxFont], and [step] values.
  ///
  /// The [minFont] is the minimum font size.
  ///
  /// The [maxFont] is the maximum font size.
  ///
  /// The [step] is the increment to increase the font size by for each
  /// breakpoint.
  ///
  /// The [breakpoint] is the current screen width breakpoint.
  ///
  /// Returns the calculated font size.
  static double calcFontSize({
    required final double minFont,
    required final double maxFont,
    required final double step,
    required final int breakpoint,
  }) =>
      ResizableTextStyle._calcFontSize(
        minFont: minFont,
        maxFont: maxFont,
        step: step,
        breakpoint: breakpoint,
      );
}
