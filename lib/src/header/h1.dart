import '../resizable/resizable_text.dart';
import '../resizable/resizable_text_style.dart';
import '../utils.dart';

/// H1, bold, 44px, 1.3 x font-size = line-height
class H1 extends ResizableText {
  /// Constructs a resizable [H1].
  const H1(
    super.data, {
    super.style = H1.defaultStyle,
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
  const H1.rich(
    super.textSpan, {
    super.style = H1.defaultStyle,
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
    minFont: kH1MinFont,
    maxFont: kH1MaxFont,
    height: kHeaderLineHeightFactor,
  );
}
