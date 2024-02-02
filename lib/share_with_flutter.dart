import 'share_with_flutter_platform_interface.dart';

class ShareWithFlutter {
  static Future<String?> getPlainText() {
    return ShareWithFlutterPlatform.instance.getPlainText();
  }
}
