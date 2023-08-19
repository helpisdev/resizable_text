import '../resizable/resizable_text.dart';
import '../resizable/resizable_text_style.dart';
import '../utils.dart';

/// BodyLarge, semi-bold, 20px, 1.5 x font-size = line-height
class BodyLarge extends ResizableText {
  /// Constructs a resizable [BodyLarge].
  const BodyLarge(
    super.data, {
    super.style = BodyLarge.defaultStyle,
    super.key,
    super.maxLines,
    super.overflow,
    super.softWrap,
    super.locale,
    super.selectionColor,
    super.semanticsLabel,
    super.strutStyle,
    super.textAlign,
    super.textDirection,
    super.textHeightBehavior,
    super.textScaleFactor,
    super.textWidthBasis,
  }) : super();

  /// Calls [ResizableText.rich] with the responsive text.
  const BodyLarge.rich(
    super.textSpan, {
    super.style = BodyLarge.defaultStyle,
    super.key,
    super.maxLines,
    super.overflow,
    super.softWrap,
    super.locale,
    super.selectionColor,
    super.semanticsLabel,
    super.strutStyle,
    super.textAlign,
    super.textDirection,
    super.textHeightBehavior,
    super.textScaleFactor,
    super.textWidthBasis,
  }) : super.rich();

  static const ResizableTextStyle defaultStyle = ResizableTextStyle(
    // ignore: avoid_redundant_argument_values
    maxFont: kBodyLargeMaxFont,
    fontWeight: kBodyFontWeight,
    minFont: kBodyLargeMinFont,
    height: kBodyLineHeightFactor,
  );
}
