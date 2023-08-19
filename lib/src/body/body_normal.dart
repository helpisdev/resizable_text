import '../resizable/resizable_text.dart';
import '../resizable/resizable_text_style.dart';
import '../utils.dart';

/// BodyNormal, semi-bold, 16px, 1.5 x font-size = line-height
class BodyNormal extends ResizableText {
  /// Constructs a resizable [BodyNormal].
  const BodyNormal(
    super.data, {
    super.style = BodyNormal.defaultStyle,
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
  const BodyNormal.rich(
    super.textSpan, {
    super.style = BodyNormal.defaultStyle,
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
    fontWeight: kBodyFontWeight,
    minFont: kBodyNormalMinFont,
    // ignore: avoid_redundant_argument_values
    maxFont: kBodyNormalMaxFont,
    height: kBodyLineHeightFactor,
  );
}
