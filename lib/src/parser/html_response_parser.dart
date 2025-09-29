import 'package:html/dom.dart';
import '../core/html_document_wrapper.dart';
import '../core/html_parser_factory.dart';
import 'html_extraction_result.dart';

/// Main class for parsing HTML responses and extracting elements easily.
class HtmlResponseParser {
  final HtmlDocumentWrapper _wrapper;

  HtmlResponseParser._(this._wrapper);

  /// Create parser from a raw HTML string
  factory HtmlResponseParser.fromString(String html) {
    final doc = HtmlParserFactory.fromString(html);
    return HtmlResponseParser._(HtmlDocumentWrapper(doc));
  }

  /// Create parser directly from a Dio Response
  factory HtmlResponseParser.fromResponse(String response) {
    final doc = HtmlParserFactory.fromResponse(response);
    return HtmlResponseParser._(HtmlDocumentWrapper(doc));
  }

  /// Extracts text content of the first element matching the selector.
  String? textOf(String selector) => _wrapper.selectText(selector);

  /// Extracts attribute value of the first element matching the selector.
  String? attr(String selector, String attribute) =>
      _wrapper.selectAttr(selector, attribute);

  /// Extracts all text contents of elements matching the selector.
  List<String> list(String selector) => _wrapper.selectAllText(selector);

  /// Returns true if an element matching the selector exists.
  bool exists(String selector) => _wrapper.exists(selector);

  /// Extracts both text and attributes of the element matching the selector.
  HtmlExtractionResult extract(String selector) {
    final el = _wrapper.element(selector);
    if (el == null) return HtmlExtractionResult.empty();
    return HtmlExtractionResult(
      found: true,
      text: el.text.trim(),
      // Ensure attributes conform to Map<String, String>
      attributes: Map<String, String>.from(el.attributes),
    );
  }

  /// Returns the raw HTML Document for advanced use.
  Document get rawDocument => _wrapper.document;
}
