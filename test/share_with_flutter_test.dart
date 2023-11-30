import 'package:flutter_test/flutter_test.dart';
import 'package:share_with_flutter/share_with_flutter.dart';
import 'package:share_with_flutter/share_with_flutter_platform_interface.dart';
import 'package:share_with_flutter/share_with_flutter_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockShareWithFlutterPlatform
    with MockPlatformInterfaceMixin
    implements ShareWithFlutterPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final ShareWithFlutterPlatform initialPlatform = ShareWithFlutterPlatform.instance;

  test('$MethodChannelShareWithFlutter is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelShareWithFlutter>());
  });

  test('getPlatformVersion', () async {
    ShareWithFlutter shareWithFlutterPlugin = ShareWithFlutter();
    MockShareWithFlutterPlatform fakePlatform = MockShareWithFlutterPlatform();
    ShareWithFlutterPlatform.instance = fakePlatform;

    expect(await shareWithFlutterPlugin.getPlatformVersion(), '42');
  });
}
