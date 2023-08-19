import 'dart:ui' as ui;

import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

// Display constants
/// The line height factor for display text.
const double kDisplayLineHeightFactor = 1.3;

/// The font weight for display text.
const FontWeight kDisplayFontWeight = FontWeight.w200;

/// The minimum font size for display1 text.
const double kDisplay1MinFont = 48;

/// The maximum font size for display1 text.
const double kDisplay1MaxFont = kDisplay1MinFont * kDisplayLineHeightFactor;

/// The minimum font size for display2 text.
const double kDisplay2MinFont = 40;

/// The maximum font size for display2 text.
const double kDisplay2MaxFont = kDisplay2MinFont * kDisplayLineHeightFactor;

// Header constants
/// The line height factor for header text.
const double kHeaderLineHeightFactor = 1.3;

/// The font weight for header text.
const FontWeight kHeaderFontWeight = FontWeight.bold;

/// The minimum font size for h1 header text.
const double kH1MinFont = 44;

/// The maximum font size for h1 header text.
const double kH1MaxFont = kH1MinFont * kHeaderLineHeightFactor;

/// The minimum font size for h2 header text.
const double kH2MinFont = 36;

/// The maximum font size for h2 header text.
const double kH2MaxFont = kH2MinFont * kHeaderLineHeightFactor;

/// The minimum font size for h3 header text.
const double kH3MinFont = 28;

/// The maximum font size for h3 header text.
const double kH3MaxFont = kH3MinFont * kHeaderLineHeightFactor;

/// The minimum font size for h4 header text.
const double kH4MinFont = 24;

/// The maximum font size for h4 header text.
const double kH4MaxFont = kH4MinFont * kHeaderLineHeightFactor;

/// The minimum font size for h5 header text.
const double kH5MinFont = 20;

/// The maximum font size for h5 header text.
const double kH5MaxFont = kH5MinFont * kHeaderLineHeightFactor;

/// The minimum font size for h6 header text.
const double kH6MinFont = 16;

/// The maximum font size for h6 header text.
const double kH6MaxFont = kH6MinFont * kHeaderLineHeightFactor;

// Body constants
/// The line height factor for body text.
const double kBodyLineHeightFactor = 1.5;

/// The font weight for body text.
const FontWeight kBodyFontWeight = FontWeight.w600;

/// The minimum font size for small body text.
const double kBodySmallMinFont = 14;

/// The maximum font size for small body text.
const double kBodySmallMaxFont = kBodySmallMinFont * kBodyLineHeightFactor;

/// The minimum font size for normal body text.
const double kBodyNormalMinFont = 16;

/// The maximum font size for normal body text.
const double kBodyNormalMaxFont = kBodyNormalMinFont * kBodyLineHeightFactor;

/// The minimum font size for medium body text.
const double kBodyMediumMinFont = 18;

/// The maximum font size for medium body text.
const double kBodyMediumMaxFont = kBodyMediumMinFont * kBodyLineHeightFactor;

/// The minimum font size for large body text.
const double kBodyLargeMinFont = 20;

/// The maximum font size for large body text.
const double kBodyLargeMaxFont = kBodyLargeMinFont * kBodyLineHeightFactor;

// Lead paragraph constants
/// The line height factor for lead paragraph text.
const double kLeadParagraphLineHeightFactor = 1.7;

/// The font weight for lead paragraph text.
const FontWeight kLeadParagraphFontWeight = FontWeight.normal;

/// The minimum font size for lead paragraph text.
const double kLeadParagraphMinFont = 22;

/// The maximum font size for lead paragraph text.
const double kLeadParagraphMaxFont =
    kLeadParagraphMinFont * kLeadParagraphLineHeightFactor;

// Label constants
/// The line height factor for label text.
const double kLabelLineHeightFactor = 1.1;

/// The font weight for label text.
const FontWeight kLabelFontWeight = FontWeight.w500;

/// The minimum font size for extra small label text.
const double kLabelExtraSmallMinFont = 10;

/// The maximum font size for extra small label text.
const double kLabelExtraSmallMaxFont =
    kLabelExtraSmallMinFont * kLabelLineHeightFactor;

/// The minimum font size for small label text.
const double kLabelSmallMinFont = 12;

/// The maximum font size for small label text.
const double kLabelSmallMaxFont = kLabelSmallMinFont * kLabelLineHeightFactor;

/// The minimum font size for normal label text.
const double kLabelNormalMinFont = 14;

/// The maximum font size for normal label text.
const double kLabelNormalMaxFont = kLabelNormalMinFont * kLabelLineHeightFactor;

/// The minimum font size for large label text.
const double kLabelLargeMinFont = 16;

/// The maximum font size for large label text.
const double kLabelLargeMaxFont = kLabelLargeMinFont * kLabelLineHeightFactor;

/// The minimum font size for extra large label text.
const double kLabelExtraLargeMinFont = 18;

/// The maximum font size for extra large label text.
const double kLabelExtraLargeMaxFont =
    kLabelExtraLargeMinFont * kLabelLineHeightFactor;

/// Copy extension on [RichText]
extension Copy on RichText {
  /// Allows copying a [RichText] with optional overrides.
  ///
  /// - [text] -> The text to display.
  /// - [textAlign] -> How the text should be aligned horizontally.
  /// - [textDirection] -> The directionality of the text.
  /// - [softWrap] -> Whether the text should break at soft line breaks.
  /// - [overflow] -> How visual overflow should be handled.
  /// - [textScaleFactor] -> The scaling factor for text.
  /// - [maxLines] -> The maximum number of lines for the text to span, wrapping
  ///   if necessary.
  /// - [locale] -> The locale used to select region-specific glyphs and
  ///   formatting.
  /// - [strutStyle] -> The strut style used for the text.
  /// - [textWidthBasis] -> The sizing basis for the width of the text
  ///   container.
  /// - [textHeightBehavior] -> The behavior for computing the height of the
  ///   text.
  /// - [selectionRegistrar] -> A registrar for building a selection.
  /// - [selectionColor] -> The color to use when painting the selection.
  ///
  /// Returns a new [RichText] with the given fields replaced by the non-null
  /// parameters.
  RichText copyWith({
    final InlineSpan? text,
    final TextAlign? textAlign,
    final TextDirection? textDirection,
    final bool? softWrap,
    final TextOverflow? overflow,
    final double? textScaleFactor,
    final int? maxLines,
    final Locale? locale,
    final StrutStyle? strutStyle,
    final TextWidthBasis? textWidthBasis,
    final ui.TextHeightBehavior? textHeightBehavior,
    final SelectionRegistrar? selectionRegistrar,
    final Color? selectionColor,
  }) =>
      copyWith(
        text: text ?? this.text,
        textAlign: textAlign ?? this.textAlign,
        textDirection: textDirection ?? this.textDirection,
        softWrap: softWrap ?? this.softWrap,
        overflow: overflow ?? this.overflow,
        textScaleFactor: textScaleFactor ?? this.textScaleFactor,
        maxLines: maxLines ?? this.maxLines,
        locale: locale ?? this.locale,
        strutStyle: strutStyle ?? this.strutStyle,
        textWidthBasis: textWidthBasis ?? this.textWidthBasis,
        textHeightBehavior: textHeightBehavior ?? this.textHeightBehavior,
        selectionRegistrar: selectionRegistrar ?? this.selectionRegistrar,
        selectionColor: selectionColor ?? this.selectionColor,
      );
}
