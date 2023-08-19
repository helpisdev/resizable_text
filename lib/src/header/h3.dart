import '../resizable/resizable_text.dart';
import '../resizable/resizable_text_style.dart';
import '../utils.dart';

/// H3, bold, 28px, 1.3 x font-size = line-height
class H3 extends ResizableText {
  /// Constructs a resizable [H3].
  const H3(
    super.data, {
    super.style = H3.defaultStyle,
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
  const H3.rich(
    super.textSpan, {
    super.style = H3.defaultStyle,
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
    fontWeight: kHeaderFontWeight,
    minFont: kH3MinFont,
    maxFont: kH3MaxFont,
    height: kHeaderLineHeightFactor,
  );
}
