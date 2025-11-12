import 'package:mime_dart/mime_dart.dart';
import 'package:html/dom.dart';

import '../enough_mail_html_base.dart';

/// Removes script references from a DOM
class RemoveScriptTransformer extends DomTransformer {
  /// Creates a new script removing transformer
  const RemoveScriptTransformer();
  @override
  void process(
    Document document,
    MimeMessage message,
    TransformConfiguration configuration,
  ) {
    final scriptElements = document.getElementsByTagName('script');
    for (final scriptElement in scriptElements) {
      scriptElement.remove();
      //TODO remove onClick etc handlers?
    }
  }
}
