import '../resizable/resizable_text.dart';
import '../resizable/resizable_text_style.dart';
import '../utils.dart';

/// BodySmall, semi-bold, 14px, 1.5 x font-size = line-height
class BodySmall extends ResizableText {
  /// Constructs a resizable [BodySmall].
  const BodySmall(
    super.data, {
    super.style = BodySmall.defaultStyle,
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
  const BodySmall.rich(
    super.textSpan, {
    super.style = BodySmall.defaultStyle,
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
    minFont: kBodySmallMinFont,
    maxFont: kBodySmallMaxFont,
    height: kBodyLineHeightFactor,
  );
}
