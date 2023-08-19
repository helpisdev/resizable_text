import '../resizable/resizable_text.dart';
import '../resizable/resizable_text_style.dart';
import '../utils.dart';

/// Display 2, extra-light, 40px, 1.3 x font-size = line-height
class Display2 extends ResizableText {
  /// Constructs a resizable [Display2].
  const Display2(
    super.data, {
    super.style = Display2.defaultStyle,
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
  const Display2.rich(
    super.textSpan, {
    super.style = Display2.defaultStyle,
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
    fontWeight: kDisplayFontWeight,
    minFont: kDisplay2MinFont,
    maxFont: kDisplay2MaxFont,
    height: kDisplayLineHeightFactor,
  );
}
