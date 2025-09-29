import 'package:html_response_parser/html_response_parser.dart';
import 'package:test/test.dart';

void main() {
  const html = '''
    <html>
      <body>
        <div id="name">Ahmed</div>
        <a href="https://example.com">Visit</a>
        <ul>
          <li>One</li>
          <li>Two</li>
        </ul>
      </body>
    </html>
  ''';

  test('Extract text correctly', () {
    final parser = HtmlResponseParser.fromString(html);
    expect(parser.textOf('#name'), equals('Ahmed'));
  });

  test('Extract attribute correctly', () {
    final parser = HtmlResponseParser.fromString(html);
    expect(parser.attr('a', 'href'), equals('https://example.com'));
  });

  test('Extract list correctly', () {
    final parser = HtmlResponseParser.fromString(html);
    expect(parser.list('li'), equals(['One', 'Two']));
  });

  test('Detect element existence', () {
    final parser = HtmlResponseParser.fromString(html);
    expect(parser.exists('a'), isTrue);
    expect(parser.exists('.missing'), isFalse);
  });
}
