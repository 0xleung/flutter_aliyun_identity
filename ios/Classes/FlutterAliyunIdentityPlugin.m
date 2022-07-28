#import "FlutterAliyunIdentityPlugin.h"
#if __has_include(<flutter_aliyun_identity/flutter_aliyun_identity-Swift.h>)
#import <flutter_aliyun_identity/flutter_aliyun_identity-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flutter_aliyun_identity-Swift.h"
#endif

@implementation FlutterAliyunIdentityPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterAliyunIdentityPlugin registerWithRegistrar:registrar];
}
@end
