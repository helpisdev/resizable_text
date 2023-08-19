import '../resizable/resizable_text.dart';
import '../resizable/resizable_text_style.dart';
import '../utils.dart';

/// LabelLarge, medium, 16px, 1.1 x font-size = line-height
class LabelLarge extends ResizableText {
  /// Constructs a resizable [LabelLarge].
  const LabelLarge(
    super.data, {
    super.style = LabelLarge.defaultStyle,
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
  const LabelLarge.rich(
    super.textSpan, {
    super.style = LabelLarge.defaultStyle,
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
    minFont: kLabelLargeMinFont,
    maxFont: kLabelLargeMaxFont,
    height: kLabelLineHeightFactor,
  );
}
