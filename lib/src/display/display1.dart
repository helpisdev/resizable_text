import '../resizable/resizable_text.dart';
import '../resizable/resizable_text_style.dart';
import '../utils.dart';

/// Display 1, extra-light, 48px, 1.3 x font-size = line-height
class Display1 extends ResizableText {
  /// Constructs a resizable [Display1].
  const Display1(
    super.data, {
    super.style = Display1.defaultStyle,
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
  const Display1.rich(
    super.textSpan, {
    super.style = Display1.defaultStyle,
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
    minFont: kDisplay1MinFont,
    maxFont: kDisplay1MaxFont,
    height: kDisplayLineHeightFactor,
  );
}
