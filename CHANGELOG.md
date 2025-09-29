## [0.0.1] - 2025-09-29

### Added
- Initial release of **flutter_webview_renderer**.
- Added `HtmlResponseParser` for parsing full HTML responses.
- Added `HtmlElementExtractor` for extracting elements such as:
  - `<input>`
  - `<button>`
  - `<a>` (links)
- Added `HtmlErrorHandler` for detecting common HTML error pages (404, 500, etc.).
- Added `HtmlErrorModel` for structured error representation.
- Added unit tests for:
  - HTML parsing
  - Element extraction
  - Error detection
- Added `README.md` documentation with usage examples.
- Added full project structure with organized directories:
  - `parser/`
  - `utils/`
  - `models/`
  - `test/`