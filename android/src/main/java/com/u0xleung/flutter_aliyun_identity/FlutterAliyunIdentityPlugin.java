package com.u0xleung.flutter_aliyun_identity;

import android.app.Activity;
import android.content.Context;
import android.util.Log;

import androidx.annotation.NonNull;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;


import com.aliyun.identity.platform.api.IdentityCallback;
import com.aliyun.identity.platform.api.IdentityPlatform;
import com.aliyun.identity.platform.api.IdentityResponse;
import com.aliyun.identity.platform.api.IdentityResponseCode;

import io.flutter.plugin.common.PluginRegistry.Registrar;

/** FlutterAliyunIdentityPlugin */
public class FlutterAliyunIdentityPlugin implements FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private MethodChannel channel;

  private Context context;


  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "flutter_aliyun_identity");
    channel.setMethodCallHandler(this);
      Log.d("flutter", "onAttachedToEngine: oooooo le");
    context = flutterPluginBinding.getApplicationContext();
      Log.d("flutter", "onAttachedToEngine: end");
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {

    if (call.method.equals("strongRealInstall")) {
        Log.d("flutter", context.toString());
     IdentityPlatform.getInstance().install(context);
      result.success(true);
    }else if (call.method.equals("strongRealMetaInfos")) {
      String metaInfo = IdentityPlatform.getMetaInfo(context);
      result.success(metaInfo);
    }else if (call.method.equals("strongRealVerify")) {
      String certifyId = call.argument("id");
      // 开启验证。
      IdentityPlatform.getInstance().faceVerify(certifyId, null, new IdentityCallback() {
          @Override
          public boolean response(final IdentityResponse response) {
              if (IdentityResponseCode.IDENTITY_SUCCESS == response.code) {
                  result.success(true);
              } else {
                  result.success(false);
              }
              return true;
          }
      });
    }else{
      result.notImplemented();
    }
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }
}
