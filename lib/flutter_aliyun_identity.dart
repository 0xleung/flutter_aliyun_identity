
import 'flutter_aliyun_identity_platform_interface.dart';

class FlutterAliyunIdentity {
  Future<String?> getPlatformVersion() {
    return FlutterAliyunIdentityPlatform.instance.getPlatformVersion();
  }
}
