import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'share_with_flutter_method_channel.dart';

abstract class ShareWithFlutterPlatform extends PlatformInterface {
  /// Constructs a ShareWithFlutterPlatform.
  ShareWithFlutterPlatform() : super(token: _token);

  static final Object _token = Object();

  static ShareWithFlutterPlatform _instance = MethodChannelShareWithFlutter();

  /// The default instance of [ShareWithFlutterPlatform] to use.
  ///
  /// Defaults to [MethodChannelShareWithFlutter].
  static ShareWithFlutterPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ShareWithFlutterPlatform] when
  /// they register themselves.
  static set instance(ShareWithFlutterPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
