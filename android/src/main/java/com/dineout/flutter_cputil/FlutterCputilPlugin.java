package com.dineout.flutter_cputil;

import android.util.Log;

import androidx.annotation.NonNull;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

/** FlutterCputilPlugin */
public class FlutterCputilPlugin implements FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private MethodChannel channel;

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "flutter_cputil");
    channel.setMethodCallHandler(this);
  }

  @Override
  public void onMethodCall(
      @NonNull MethodCall call, @NonNull
      Result result
  ) {
    if (call.method.equals("convert") && arguments != null) {
      try {
        String template = call.argument("template");
        Log.d("Convert", "Android " + android.os.Build.VERSION.RELEASE);
        Log.d("Convert", "Template: " + template);
        result.success(template.getBytes());

      } catch (Exception e) {
        result.error("ConvertError", e.getMessage(), e);
      }
    } else {
      result.notImplemented();
    }
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }
}
