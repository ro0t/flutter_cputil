import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_cputil_platform_interface.dart';

/// An implementation of [FlutterCputilPlatform] that uses method channels.
class MethodChannelFlutterCputil extends FlutterCputilPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_cputil');

  @override
  Future<Uint8List?> convert(String template) async {
    return await methodChannel.invokeMethod<Uint8List>('convert', {
      "template": template
    });
  }
}
