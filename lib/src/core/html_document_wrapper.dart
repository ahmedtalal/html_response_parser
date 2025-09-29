import 'package:html/dom.dart';
import '../parser/html_query_utils.dart';

/// Wrapper around HTML Document providing simple accessors.
class HtmlDocumentWrapper {
  final Document _doc;

  HtmlDocumentWrapper(this._doc);

  /// Returns the text content of the first element matching the selector.
  String? selectText(String selector) =>
      HtmlQueryUtils.getText(_doc.querySelector(selector));

  /// Returns the value of a specific attribute of the first matching element.
  String? selectAttr(String selector, String attr) =>
      HtmlQueryUtils.getAttr(_doc.querySelector(selector), attr);

  /// Returns the list of text contents for all elements matching the selector.
  List<String> selectAllText(String selector) =>
      HtmlQueryUtils.getTextList(_doc.querySelectorAll(selector));

  /// Returns true if any element matches the selector.
  bool exists(String selector) => _doc.querySelector(selector) != null;

  /// Returns the first matching element (if any).
  Element? element(String selector) => _doc.querySelector(selector);

  /// Exposes the raw parsed document for advanced queries.
  Document get document => _doc;
}
