import '../resizable/resizable_text.dart';
import '../resizable/resizable_text_style.dart';
import '../utils.dart';

/// BodyMedium, semi-bold, 18px, 1.5 x font-size = line-height
class BodyMedium extends ResizableText {
  /// Constructs a resizable [BodyMedium].
  const BodyMedium(
    super.data, {
    super.style = BodyMedium.defaultStyle,
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
  const BodyMedium.rich(
    super.textSpan, {
    super.style = BodyMedium.defaultStyle,
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
    minFont: kBodyMediumMinFont,
    maxFont: kBodyMediumMaxFont,
    height: kBodyLineHeightFactor,
  );
}
