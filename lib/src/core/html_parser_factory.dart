import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart';

/// A factory class to create HTML [Document] objects from various sources.
class HtmlParserFactory {
  /// Create a document directly from a raw HTML string.
  static Document fromString(String html) => parse(html);

  /// Create a document from a Dio Response object.
  static Document fromResponse(String response) {
    return parse(response);
  }
}
