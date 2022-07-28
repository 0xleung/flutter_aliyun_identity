import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_aliyun_identity_platform_interface.dart';

/// An implementation of [FlutterAliyunIdentityPlatform] that uses method channels.
class MethodChannelFlutterAliyunIdentity extends FlutterAliyunIdentityPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_aliyun_identity');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  Future<bool> realInstall() async {
    final bool rst = await methodChannel.invokeMethod('strongRealInstall');
    return rst;
  }

  Future<Map> realMetaInfos() async {
    final String info = await methodChannel.invokeMethod('strongRealMetaInfos');
    return jsonDecode(info) as Map;
  }

  Future<bool> realVerify(String id) async {
    final bool rst =
        await methodChannel.invokeMethod('strongRealVerify', {'id': id});
    return rst;
  }
}
