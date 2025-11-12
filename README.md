Generate html code from any email mime message for displaying it.
 
## Usage
The `mime_html_dart` package defines the `transformToHtml()` extension method on `MimeMessage` of the [mime_dart](https://github.com/canarymail/mime_dart) package.

This method will always generate HTML, specifically also for plain text or empty messages.
You can define your custom processors
* for converting a plain text message into HTML,
* for adapting the HTML message,
* for handling inline attachments.

A simple usage example:

```dart
import 'package:mime_dart/mime_dart.dart';
import 'package:mime_html_dart/mime_html_dart.dart';

String generateHtml(MimeMessage mimeMessage) {
  return mimeMessage.transformToHtml(
        blockExternalImages: false, 
        emptyMessageText: 'Nothing here, move on!',
  );
}

String generatePlainText(String htmlText) {
  return HtmlToPlainTextConverter.convert(htmlText);
}
```

More examples:
```dart
import 'package:mime_dart/mime_dart.dart';
import 'package:mime_html_dart/mime_html_dart.dart';
import 'package:html/dom.dart';

String simpleTransformExample(MimeMessage mimeMessage) {
  return mimeMessage.transformToHtml();
}

String configureImageBlockingOrEmptyMessage(MimeMessage mimeMessage) {
  return mimeMessage.transformToHtml(
      blockExternalImages: true, emptyMessageText: 'Nothing here, move on!');
}

String playYourself(MimeMessage mimeMessage) {
  final cfg = TransformConfiguration.create(
      blockExternalImages: true,
      emptyMessageText: 'Nothing here, move on!',
      customDomTransformers: [StyleTextDomTransformer()],
      customValues: {'textStyle': 'font-size:10px;font-family:verdana;'},
  );
  return mimeMessage.transformToHtml(transformConfiguration: cfg);
}

class StyleTextDomTransformer extends DomTransformer {
  @override
  void process(Document document, MimeMessage message,
      TransformConfiguration configuration) {
    final paragraphs = document.getElementsByTagName('p');
    for (final paragraph in paragraphs) {
      paragraph.attributes['style'] = configuration.customValues['textStyle'];
    }
  }
}

```

## Installation
Add this dependency your `pubspec.yaml` file:

```
dependencies:
  mime_html_dart:
    git:
      url: https://github.com/canarymail/mime_html_dart.git
```

Note: you might need to set a dependency override for the xml package:
```
dependency_overrides:
  xml: ^6.0.1
```

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/canarymail/mime_html_dart/issues

## License

Licensed under the commercial friendly [Mozilla Public License 2.0](LICENSE).