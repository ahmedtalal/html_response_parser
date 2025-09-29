/// A structured result representing extracted HTML data.
class HtmlExtractionResult {
  /// Whether the element was found
  final bool found;

  /// The inner text of the element
  final String? text;

  /// The attributes of the element (e.g. href, src, id)
  final Map<String, String>? attributes;

  /// A list of texts (useful for list or table extractions)
  final List<String>? list;

  const HtmlExtractionResult({
    required this.found,
    this.text,
    this.attributes,
    this.list,
  });

  /// Empty result (not found)
  factory HtmlExtractionResult.empty() =>
      const HtmlExtractionResult(found: false);

  /// Convert the result to a readable Map (useful for logging or serialization)
  Map<String, dynamic> toMap() => {
        'found': found,
        'text': text,
        'attributes': attributes,
        'list': list,
      };

  @override
  String toString() => 'HtmlExtractionResult(${toMap()})';
}
