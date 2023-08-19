import '../resizable/resizable_text.dart';
import '../resizable/resizable_text_style.dart';
import '../utils.dart';

/// LeadParagraph, normal, 22px, 1.7 x font-size = line-height
class LeadParagraph extends ResizableText {
  /// Constructs a resizable [LeadParagraph].
  const LeadParagraph(
    super.data, {
    super.style = LeadParagraph.defaultStyle,
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
  const LeadParagraph.rich(
    super.textSpan, {
    super.style = LeadParagraph.defaultStyle,
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
    height: kLeadParagraphLineHeightFactor,
    fontWeight: kLeadParagraphFontWeight,
    minFont: kLeadParagraphMinFont,
    maxFont: kLeadParagraphMaxFont,
  );
}
