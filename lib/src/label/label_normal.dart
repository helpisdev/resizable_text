import '../resizable/resizable_text.dart';
import '../resizable/resizable_text_style.dart';
import '../utils.dart';

/// LabelNormal, medium, 14px, 1.1 x font-size = line-height
class LabelNormal extends ResizableText {
  /// Constructs a resizable [LabelNormal].
  const LabelNormal(
    super.data, {
    super.style = LabelNormal.defaultStyle,
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
  const LabelNormal.rich(
    super.textSpan, {
    super.style = LabelNormal.defaultStyle,
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
    fontWeight: kLabelFontWeight,
    minFont: kLabelNormalMinFont,
    maxFont: kLabelNormalMaxFont,
    height: kLabelLineHeightFactor,
  );
}
