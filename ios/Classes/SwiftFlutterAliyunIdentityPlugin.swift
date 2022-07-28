import Flutter
import UIKit

public class SwiftFlutterAliyunIdentityPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_aliyun_identity", binaryMessenger: registrar.messenger())
    let instance = SwiftFlutterAliyunIdentityPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }
}
