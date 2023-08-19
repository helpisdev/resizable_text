import '../resizable/resizable_text.dart';
import '../resizable/resizable_text_style.dart';
import '../utils.dart';

/// LabelExtraSmall, medium, 10px, 1.1 x font-size = line-height
class LabelExtraSmall extends ResizableText {
  /// Constructs a resizable [LabelExtraSmall].
  const LabelExtraSmall(
    super.data, {
    super.style = LabelExtraSmall.defaultStyle,
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
  const LabelExtraSmall.rich(
    super.textSpan, {
    super.style = LabelExtraSmall.defaultStyle,
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
    minFont: kLabelExtraSmallMinFont,
    maxFont: kLabelExtraSmallMaxFont,
    height: kLabelLineHeightFactor,
  );
}
