import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_aliyun_identity/flutter_aliyun_identity.dart';
import 'package:flutter_aliyun_identity/flutter_aliyun_identity_platform_interface.dart';
import 'package:flutter_aliyun_identity/flutter_aliyun_identity_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterAliyunIdentityPlatform
    with MockPlatformInterfaceMixin
    implements FlutterAliyunIdentityPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<bool> realInstall() {
    // TODO: implement realInstall
    throw UnimplementedError();
  }

  @override
  Future<Map> realMetaInfos() {
    // TODO: implement realMetaInfos
    throw UnimplementedError();
  }

  @override
  Future<bool> realVerify(String id) {
    // TODO: implement realVerify
    throw UnimplementedError();
  }
}

void main() {
  final FlutterAliyunIdentityPlatform initialPlatform =
      FlutterAliyunIdentityPlatform.instance;

  test('$MethodChannelFlutterAliyunIdentity is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterAliyunIdentity>());
  });

  test('getPlatformVersion', () async {
    FlutterAliyunIdentity flutterAliyunIdentityPlugin = FlutterAliyunIdentity();
    MockFlutterAliyunIdentityPlatform fakePlatform =
        MockFlutterAliyunIdentityPlatform();
    FlutterAliyunIdentityPlatform.instance = fakePlatform;

    expect(await flutterAliyunIdentityPlugin.getPlatformVersion(), '42');
  });
}
