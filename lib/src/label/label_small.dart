import '../resizable/resizable_text.dart';
import '../resizable/resizable_text_style.dart';
import '../utils.dart';

/// LabelSmall, medium, 12px, 1.1 x font-size = line-height
class LabelSmall extends ResizableText {
  /// Constructs a resizable [LabelSmall].
  const LabelSmall(
    super.data, {
    super.style = LabelSmall.defaultStyle,
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
  const LabelSmall.rich(
    super.textSpan, {
    super.style = LabelSmall.defaultStyle,
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
    minFont: kLabelSmallMinFont,
    fontWeight: kLabelFontWeight,
    maxFont: kLabelSmallMaxFont,
    height: kLabelLineHeightFactor,
  );
}
