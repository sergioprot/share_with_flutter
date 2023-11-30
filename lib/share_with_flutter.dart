
import 'share_with_flutter_platform_interface.dart';

class ShareWithFlutter {
  Future<String?> getPlatformVersion() {
    return ShareWithFlutterPlatform.instance.getPlatformVersion();
  }
}
