import 'package:mime_dart/mime_dart.dart';
import 'package:mime_html_dart/mime_html_dart.dart';
import 'package:mime_html_dart/src/text/linebreak_text_transformer.dart';
import 'package:test/test.dart';

void main() {
  group('Test linebreaks', () {
    test('linebreaks', () {
      const input = 'hello\r\nworld.\n';
      const transformer = LineBreakTextTransformer();
      expect(
          transformer.transform(input, MimeMessage(),
              TransformConfiguration.standardConfiguration),
          'hello<br/>world.<br/>');
    });
  });
}
