import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'share_with_flutter_platform_interface.dart';

/// An implementation of [ShareWithFlutterPlatform] that uses method channels.
class MethodChannelShareWithFlutter extends ShareWithFlutterPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('share_with_flutter');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
