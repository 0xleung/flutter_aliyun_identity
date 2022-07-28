import 'flutter_aliyun_identity_platform_interface.dart';

class FlutterAliyunIdentity {
  Future<String?> getPlatformVersion() {
    return FlutterAliyunIdentityPlatform.instance.getPlatformVersion();
  }

  Future<bool> realInstall() async {
    final bool rst = await FlutterAliyunIdentityPlatform.instance.realInstall();
    return rst;
  }

  Future<Map> realMetaInfos() async {
    final Map info =
        await FlutterAliyunIdentityPlatform.instance.realMetaInfos();
    return info;
  }

  Future<bool> realVerify(String id) async {
    final bool rst =
        await FlutterAliyunIdentityPlatform.instance.realVerify(id);
    return rst;
  }
}
