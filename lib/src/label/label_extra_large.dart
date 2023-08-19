import '../resizable/resizable_text.dart';
import '../resizable/resizable_text_style.dart';
import '../utils.dart';

/// LabelExtraLarge, medium, 18px, 1.1 x font-size = line-height
class LabelExtraLarge extends ResizableText {
  /// Constructs a resizable [LabelExtraLarge].
  const LabelExtraLarge(
    super.data, {
    super.style = LabelExtraLarge.defaultStyle,
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
  const LabelExtraLarge.rich(
    super.textSpan, {
    super.style = LabelExtraLarge.defaultStyle,
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
    minFont: kLabelExtraLargeMinFont,
    maxFont: kLabelExtraLargeMaxFont,
    height: kLabelLineHeightFactor,
  );
}
