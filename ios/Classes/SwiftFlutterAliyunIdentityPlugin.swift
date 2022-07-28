import Flutter
import UIKit

public class SwiftFlutterAliyunIdentityPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_aliyun_identity", binaryMessenger: registrar.messenger())
    let instance = SwiftFlutterAliyunIdentityPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if(call.method == "strongRealInstall"){
        AliyunIdentityPlatform.sharedInstance().install();
        result(true)
    }else if(call.method == "strongRealMetaInfos"){
        let rst = AliyunIdentityPlatform.sharedInstance().getMetaInfo();
        result(rst)
    }else if(call.method == "strongRealVerify"){
      let idMap = call.arguments as! Dictionary<String, String>;
      let rst = false;
      let extParams: [String : Any] = [:];
      AliyunIdentityPlatform.sharedInstance().faceVerify(withCertifyId: idMap["id"]!, withCurrentViewController: UIApplication.shared.keyWindow?.rootViewController, withExtParams: extParams, complete: { (response)-> () in
        var resString = ""
        var rst = false;
        switch response?.code {
          case 1000:
            resString = "认证成功"
              rst = true;
              break
          case 1001:
              resString = "认证失败"
            break
          case 1002:
              resString = "系统异常"
            break
          case 1003:
              resString = "SDK初始化失败，请确认客户端时间是否正确"
            break
          case 1004:
              resString = "摄像头错误"
            break
          case 1005:
              resString = "网络错误"
            break
          case 1006:
              resString = "用户取消"
            break
          case 1007:
              resString = "CertifyId无效"
            break
          case 1009:
              resString = "客户端时间戳错误"
            break
          default:
              resString = "未知错误"
              break
        }
        NSLog("%@",resString )
        return result(rst)
      })
    }
  }
}