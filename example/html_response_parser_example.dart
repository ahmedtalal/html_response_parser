import 'package:html_response_parser/html_response_parser.dart';

Future<void> main() async {

  // Example 1: from raw HTML string
  const html = '''
    <html>
      <body>
        <h1>Welcome Ahmed</h1>
        <a href="https://flutter.dev">Flutter Website</a>
        <ul>
          <li>Session 1</li>
          <li>Session 2</li>
        </ul>
      </body>
    </html>
  ''';

  final parser = HtmlResponseParser.fromString(html);

  print('Title: ${parser.textOf('h1')}');
  print('Link: ${parser.attr('a', 'href')}');
  print('Items: ${parser.list('li')}');

  // Example 2: from Dio response
  final parser2 = HtmlResponseParser.fromResponse(html);

  print('Page Title: ${parser2.textOf('title')}');
}
