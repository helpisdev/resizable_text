import '../resizable/resizable_text.dart';
import '../resizable/resizable_text_style.dart';
import '../utils.dart';

/// H6, bold, 16px, 1.3 x font-size = line-height
class H6 extends ResizableText {
  /// Constructs a resizable [H6].
  const H6(
    super.data, {
    super.style = H6.defaultStyle,
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
  const H6.rich(
    super.textSpan, {
    super.style = H6.defaultStyle,
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
    minFont: kH6MinFont,
    maxFont: kH6MaxFont,
    height: kHeaderLineHeightFactor,
  );
}
