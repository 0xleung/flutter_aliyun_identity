import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_aliyun_identity_method_channel.dart';

abstract class FlutterAliyunIdentityPlatform extends PlatformInterface {
  /// Constructs a FlutterAliyunIdentityPlatform.
  FlutterAliyunIdentityPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterAliyunIdentityPlatform _instance =
      MethodChannelFlutterAliyunIdentity();

  /// The default instance of [FlutterAliyunIdentityPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterAliyunIdentity].
  static FlutterAliyunIdentityPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterAliyunIdentityPlatform] when
  /// they register themselves.
  static set instance(FlutterAliyunIdentityPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<bool> realInstall() async {
    final bool rst = await instance.realInstall();
    return rst;
  }

  Future<Map> realMetaInfos() async {
    final Map info = await instance.realMetaInfos();
    return info;
  }

  Future<bool> realVerify(String id) async {
    final bool rst = await instance.realVerify(id);
    return rst;
  }
}
