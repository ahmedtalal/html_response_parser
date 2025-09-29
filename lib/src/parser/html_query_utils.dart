import 'package:html/dom.dart';

/// A set of static helper functions for HTML element extraction.
class HtmlQueryUtils {
  /// Get text content of an element, or null if the element is null.
  static String? getText(Element? element) => element?.text.trim();

  /// Get attribute value of an element, or null if the element or attribute is missing.
  static String? getAttr(Element? element, String attr) =>
      element?.attributes[attr];

  /// Get a list of text contents from a list of elements.
  static List<String> getTextList(List<Element> elements) =>
      elements.map((e) => e.text.trim()).toList();
}
