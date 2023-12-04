/*
TODO(helpisdev): Provide app wide default values configuration options.

TODO(helpisdev): Provide different formulas.
 Currently, smallest and largest breakpoints are fixed at 0 and 1920
 respectively, while the needed step to achieve a factor X (at largest
 breakpoint have fontAtSmallest x factor == fontAtLargest) is only user
 provided.
 - any other combination of provided:
 - - step
 - - factor (go from smallest to largest breakpoint in steps so that
 fontAtSmallest x factor == fontAtLargest
 - - minFont
 - - maxFont
 - - ceiling (stop increasing font here, even if maxFont is not reached or
 provided)
 - - floor (stop decreasing font here, even if minFont is not reached or
 provided)
 - - smallest breakpoint (screen breakpoints acting as boundaries to produce a
 step for an X factor, or an X factor for a step)
 - - largest breakpoint
 - - smallest font breakpoint (same as screen breakpoints, but use font values
 instead e.g. for a provided factor 1.2x, a smallestFontBreakpoint of 12px, and
 a maxFont of 36px, and a largestScreenBreakpoint of 720px, calculate a step so
 that fontAt720px == 1.2 x 12px, but do not use anything over 36px
 - - largest font breakpoint
 - - shift step (for whatever calculation, shift the result by shiftStep screen
 px. Can be negative, but has a lower result boundary of zero, since there is no
 screen with negative width)
 - - Equivalent height options for width options. Cannot be used together.
 - - Equivalent aspect ratio option for width/height options. Cannot be used
 together.
 e.g. Instead of using largest breakpoint to calculate a ceiling, produce a font
 size based on step (or factor), a minFont, and a maxFont as a ceiling, at
 whatever largest breakpoint that happens to be.
 Similarly, a user could choose to narrow the value space by also providing a
 smallest breakpoint to act as a starting point, or a largest breakpoint to
 request maxFont to happen at largest breakpoint.
 Obviously, some options would be mutually exclusive, while other could be used
 in different ways. Must choose those that make the most sense, or figure out a
 way to modularize this and still make it easy to use.
 The most sensible combo probably is:
 - At smallest breakpoint and lower, have minFont
 - At largest breakpoint, have maxFont (auto-calculate step)
  OR
 - at largest breakpoint have font of factor X (auto-calculate step and
 maxFont).
*/
import 'dart:ui' as ui;

import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:screen_size_provider/screen_size_provider.dart';

import '../func.dart';
import '../utils.dart';
import 'resizable_text_style.dart';

/// Resizable text based on screen width. With the default
/// [ResizableTextStyle.step], text resizes to x1.5 of its minimum value
/// (default 12) at 1920px (FHD).
class ResizableText extends Text {
  /// Configurable resizable text based on screen width.
  const ResizableText(
    final String? data, {
    final ResizableTextStyle style = const ResizableTextStyle(),
    final TextAlign textAlign = kDefaultAlignment,
    super.key,
    super.locale,
    super.maxLines = 1,
    super.overflow,
    super.selectionColor,
    super.semanticsLabel,
    super.softWrap = true,
    super.strutStyle,
    super.textDirection,
    super.textHeightBehavior,
    super.textScaler,
    super.textWidthBasis,
  })  : _style = style,
        super(data ?? '', textAlign: textAlign, style: style);

  /// Calls [Text.rich] with the responsive text.
  const ResizableText.rich(
    super.textSpan, {
    required final ResizableTextStyle style,
    final TextAlign textAlign = kDefaultAlignment,
    super.key,
    super.locale,
    super.maxLines = 1,
    super.overflow,
    super.selectionColor,
    super.semanticsLabel,
    super.softWrap = true,
    super.strutStyle,
    super.textDirection,
    super.textHeightBehavior,
    super.textScaler,
    super.textWidthBasis,
  })  : _style = style,
        super.rich(style: style, textAlign: textAlign);

  /// The [_style] field holds the [ResizableTextStyle] for this text.
  final ResizableTextStyle _style;

  @override
  ResizableTextStyle get style => _style;

  /// The [textAlign] getter returns the [TextAlign] for this text. If not
  /// specified, defaults to [kDefaultAlignment].
  @override
  TextAlign get textAlign => super.textAlign ?? kDefaultAlignment;

  /// The [overflow] getter returns the [TextOverflow] for this text. If not
  /// specified, defaults to the [ResizableTextStyle.overflow] of [style].
  @override
  TextOverflow get overflow => super.overflow ?? _style.overflow;

  /// The [kDefaultAlignment] constant holds the default [TextAlign] of
  /// [TextAlign.start].
  static const TextAlign kDefaultAlignment = TextAlign.start;

  @override
  Widget build(final BuildContext context) => _StyledRichText(text: this);

  /// Creates a new [ResizableText] instance with the given parameters.
  ///
  /// The [data] parameter is the text to display.
  ///
  /// The [textSpan] parameter is the text span to display.
  ///
  /// The [style] parameter is the text style to apply to the text.
  ///
  /// The [textAlign] parameter is how the text should be aligned horizontally.
  ///
  /// The [key] parameter is the widget key for this text widget.
  ///
  /// The [locale] parameter is the locale used to select region-specific glyphs
  /// and formatting.
  ///
  /// The [maxLines] parameter is the maximum number of lines for the text to
  /// span, wrapping if necessary.
  ///
  /// The [overflow] parameter is how visual overflow should be handled.
  ///
  /// The [selectionColor] parameter is the color to use when painting the
  /// selection.
  ///
  /// The [semanticsLabel] parameter is the semantic label for this text.
  ///
  /// The [softWrap] parameter is whether the text should break at soft line
  /// breaks.
  ///
  /// The [strutStyle] parameter is the strut style used for the text.
  ///
  /// The [textDirection] parameter is the directionality of the text.
  ///
  /// The [textHeightBehavior] parameter is the behavior for computing the
  /// height of the text.
  ///
  /// The [textScaler] parameter is the scaling factor for text.
  ///
  /// The [textWidthBasis] parameter is the sizing basis for the width of the
  /// text container.
  ///
  /// Returns a new [ResizableText] with the given fields replaced by the
  /// non-null parameters.
  ResizableText copyWith({
    final String? data,
    final InlineSpan? textSpan,
    final ResizableTextStyle? style,
    final TextAlign? textAlign,
    final Key? key,
    final Locale? locale,
    final int? maxLines,
    final TextOverflow? overflow,
    final Color? selectionColor,
    final String? semanticsLabel,
    final bool? softWrap,
    final StrutStyle? strutStyle,
    final TextDirection? textDirection,
    final TextHeightBehavior? textHeightBehavior,
    final TextScaler? textScaler,
    final TextWidthBasis? textWidthBasis,
  }) {
    if (textSpan != null) {
      return ResizableText.rich(
        textSpan,
        style: style ?? this.style,
        textAlign: textAlign ?? this.textAlign,
        key: key ?? this.key,
        locale: locale ?? this.locale,
        maxLines: maxLines ?? this.maxLines,
        overflow: overflow ?? this.overflow,
        selectionColor: selectionColor ?? this.selectionColor,
        semanticsLabel: semanticsLabel ?? this.semanticsLabel,
        softWrap: softWrap ?? this.softWrap,
        strutStyle: strutStyle ?? this.strutStyle,
        textDirection: textDirection ?? this.textDirection,
        textHeightBehavior: textHeightBehavior ?? this.textHeightBehavior,
        textScaler: textScaler ?? this.textScaler,
        textWidthBasis: textWidthBasis ?? this.textWidthBasis,
      );
    }
    if (data != null) {
      return ResizableText(
        data,
        style: style ?? this.style,
        textAlign: textAlign ?? this.textAlign,
        key: key ?? this.key,
        locale: locale ?? this.locale,
        maxLines: maxLines ?? this.maxLines,
        overflow: overflow ?? this.overflow,
        selectionColor: selectionColor ?? this.selectionColor,
        semanticsLabel: semanticsLabel ?? this.semanticsLabel,
        softWrap: softWrap ?? this.softWrap,
        strutStyle: strutStyle ?? this.strutStyle,
        textDirection: textDirection ?? this.textDirection,
        textHeightBehavior: textHeightBehavior ?? this.textHeightBehavior,
        textScaler: textScaler ?? this.textScaler,
        textWidthBasis: textWidthBasis ?? this.textWidthBasis,
      );
    }

    if (this.textSpan != null) {
      return ResizableText.rich(
        this.textSpan!,
        style: style ?? this.style,
        textAlign: textAlign ?? this.textAlign,
        key: key ?? this.key,
        locale: locale ?? this.locale,
        maxLines: maxLines ?? this.maxLines,
        overflow: overflow ?? this.overflow,
        selectionColor: selectionColor ?? this.selectionColor,
        semanticsLabel: semanticsLabel ?? this.semanticsLabel,
        softWrap: softWrap ?? this.softWrap,
        strutStyle: strutStyle ?? this.strutStyle,
        textDirection: textDirection ?? this.textDirection,
        textHeightBehavior: textHeightBehavior ?? this.textHeightBehavior,
        textScaler: textScaler ?? this.textScaler,
        textWidthBasis: textWidthBasis ?? this.textWidthBasis,
      );
    }

    return ResizableText(
      this.data,
      style: style ?? this.style,
      textAlign: textAlign ?? this.textAlign,
      key: key ?? this.key,
      locale: locale ?? this.locale,
      maxLines: maxLines ?? this.maxLines,
      overflow: overflow ?? this.overflow,
      selectionColor: selectionColor ?? this.selectionColor,
      semanticsLabel: semanticsLabel ?? this.semanticsLabel,
      softWrap: softWrap ?? this.softWrap,
      strutStyle: strutStyle ?? this.strutStyle,
      textDirection: textDirection ?? this.textDirection,
      textHeightBehavior: textHeightBehavior ?? this.textHeightBehavior,
      textScaler: textScaler ?? this.textScaler,
      textWidthBasis: textWidthBasis ?? this.textWidthBasis,
    );
  }

  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<ResizableTextStyle>('style', style));
  }
}

// Most of the following are almost copied from flutter/material.dart etc
// in order to replicate the full text behavior while being compatible with it
// by extending it

/// The [_StyledRichText] widget provides styling to [ResizableText] widgets.
///
/// The [text] parameter specifies the [ResizableText] widget to style.
///
/// The [selectionColor] method returns the selection color for the
/// [ResizableText] by checking the following in order:
/// - [ResizableText.selectionColor]
/// - [DefaultSelectionStyle.of]
/// - [DefaultSelectionStyle.defaultColor]
///
/// The [textHeightBehavior] method returns the [TextHeightBehavior] for the
/// [ResizableText] by checking the following in order:
/// - [ResizableText.textHeightBehavior]
/// - [DefaultTextStyle.textHeightBehavior]
/// - [DefaultTextHeightBehavior.maybeOf]
///
/// The [textScaler] method returns the text scale factor for the
/// [ResizableText] by checking the following in order:
/// - [ResizableText.textScaler]
/// - [MediaQuery.textScalerOf]
///
/// The [buildTextSpan] method builds a [TextSpan] for the [ResizableText] by:
/// - Getting the effective [ResizableTextStyle]
/// - Calculating the font size using [PrivatePackageMethods.calcFontSize]
/// - Creating a [TextSpan] with the calculated style and [ResizableText.data]
/// - Adding any [InlineSpan] children from [ResizableText.textSpan]
///
/// The [build] method builds a [_RichTextMouseRegion] with the styled
/// [ResizableText]. It does the following:
/// - Gets the [DefaultTextStyle]
/// - Gets the effective [ResizableTextStyle] by inheriting from the
/// [DefaultTextStyle] if [ResizableText.style.inherit] is true
/// - Makes the text bold if [MediaQuery.boldTextOf] is true
/// - Builds the styled [TextSpan] using [buildTextSpan]
/// - Creates the [_RichTextMouseRegion] with the styled [ResizableText]
class _StyledRichText extends StatelessWidget {
  const _StyledRichText({
    required this.text,
  });

  final ResizableText text;

  Color selectionColor(final BuildContext context) =>
      text.selectionColor ??
      DefaultSelectionStyle.of(context).selectionColor ??
      DefaultSelectionStyle.defaultColor;

  TextHeightBehavior? textHeightBehavior(
    final BuildContext context,
    final DefaultTextStyle defaultTextStyle,
  ) =>
      text.textHeightBehavior ??
      defaultTextStyle.textHeightBehavior ??
      DefaultTextHeightBehavior.maybeOf(context);

  TextScaler textScaler(final BuildContext context) =>
      text.textScaler ?? MediaQuery.textScalerOf(context);

  TextSpan buildTextSpan(final ResizableText text, final BuildContext context) {
    final ResizableTextStyle effectiveTextStyle = text.style;
    return TextSpan(
      style: PrivatePackageMethods.withFontSize(
        style: effectiveTextStyle,
        fontSize: PrivatePackageMethods.calcFontSize(
          breakpoint: ScreenSizeProvider.of(context).width.toInt(),
          minFont: effectiveTextStyle.minFont,
          maxFont: effectiveTextStyle.maxFont,
          step: effectiveTextStyle.step,
        ),
        maxFont: effectiveTextStyle.maxFont,
        step: effectiveTextStyle.step,
        minFont: effectiveTextStyle.minFont,
        package: text.style.package,
        fontFamilyFallback: text.style.fontFamilyFallback,
      ),
      text: text.data,
      children: produceT1fromT2orNull<List<InlineSpan>, InlineSpan>(
        (final InlineSpan span) => <InlineSpan>[span],
        text.textSpan,
      ),
    );
  }

  @override
  Widget build(final BuildContext context) {
    final DefaultTextStyle defaultTextStyle = DefaultTextStyle.of(context);
    ResizableTextStyle effectiveTextStyle = text.style;
    if (text.style.inherit) {
      effectiveTextStyle = ResizableTextStyle.from(
        style: text.style.reverseMerge(defaultTextStyle.style),
        minFont: text.style.minFont,
        maxFont: text.style.maxFont,
        step: text.style.step,
        package: text.style.package,
        fontFamilyFallback: text.style.fontFamilyFallback,
      );
    }
    if (MediaQuery.boldTextOf(context)) {
      effectiveTextStyle = effectiveTextStyle.merge(
        const ResizableTextStyle(fontWeight: FontWeight.bold),
      );
    }
    return _RichTextMouseRegion(
      semanticsLabel: text.semanticsLabel,
      textDirection: text.textDirection,
      child: RichText(
        textAlign: text.textAlign,
        textDirection: text.textDirection,
        locale: text.locale,
        softWrap: text.softWrap ?? defaultTextStyle.softWrap,
        overflow: text.overflow,
        maxLines: text.maxLines ?? defaultTextStyle.maxLines,
        textScaler: textScaler(context),
        strutStyle: text.strutStyle,
        textWidthBasis: text.textWidthBasis ?? defaultTextStyle.textWidthBasis,
        textHeightBehavior: textHeightBehavior(context, defaultTextStyle),
        selectionColor: selectionColor(context),
        text: buildTextSpan(text.copyWith(style: effectiveTextStyle), context),
      ),
    );
  }
}

/// The [_RichTextMouseRegion] widget provides mouse interaction to [RichText]
/// widgets.
///
/// The [child] parameter specifies the [RichText] widget to provide mouse
/// interaction for.
///
/// The [semanticsLabel] parameter specifies the semantic label to provide to
/// the [RichText]. If null, no semantics are provided.
///
/// The [textDirection] parameter specifies the text direction to provide to the
/// semantics. If null, the ambient [Directionality] is used.
class _RichTextMouseRegion extends StatelessWidget {
  const _RichTextMouseRegion({
    required this.child,
    this.textDirection,
    this.semanticsLabel,
  });

  final RichText child;

  final String? semanticsLabel;

  final TextDirection? textDirection;

  @override
  Widget build(final BuildContext context) {
    final SelectionRegistrar? registrar = SelectionContainer.maybeOf(context);

    if (registrar == null) {
      return child;
    }

    return MouseRegion(
      cursor: SystemMouseCursors.text,
      child: _RichTextSemantics(
        textDirection: textDirection,
        semanticsLabel: semanticsLabel,
        child: child.copyWith(selectionRegistrar: registrar),
      ),
    );
  }

  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(StringProperty('semanticsLabel', semanticsLabel))
      ..add(EnumProperty<ui.TextDirection?>('textDirection', textDirection));
  }
}

/// The [_RichTextSemantics] widget provides semantics to [RichText] widgets.
///
/// The [child] parameter specifies the [RichText] widget to provide semantics
/// for.
///
/// The [semanticsLabel] parameter specifies the semantic label to provide to
/// the [RichText]. If null, no semantics are provided.
///
/// The [textDirection] parameter specifies the text direction to provide to the
/// semantics. If null, the ambient [Directionality] is used.
class _RichTextSemantics extends StatelessWidget {
  const _RichTextSemantics({
    required this.child,
    this.textDirection,
    this.semanticsLabel,
  });

  final RichText child;

  final String? semanticsLabel;

  final TextDirection? textDirection;

  @override
  Widget build(final BuildContext context) {
    if (semanticsLabel == null) {
      return child;
    }

    return Semantics(
      textDirection: textDirection,
      label: semanticsLabel,
      child: ExcludeSemantics(
        child: child,
      ),
    );
  }

  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(StringProperty('semanticsLabel', semanticsLabel))
      ..add(EnumProperty<ui.TextDirection>('textDirection', textDirection));
  }
}
