import 'package:mime_dart/mime_dart.dart';

import '../enough_mail_html_base.dart';

/// Comverts HTML tags in text messsages
class ConvertTagsTextTransformer implements TextTransformer {
  /// Creates a new tag transformer
  const ConvertTagsTextTransformer();

  @override
  String transform(String text, MimeMessage message,
          TransformConfiguration configuration) =>
      text.replaceAll('<', '&lt;').replaceAll('>', '&gt;');
}
