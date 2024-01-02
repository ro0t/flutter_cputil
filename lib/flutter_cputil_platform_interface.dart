import 'dart:typed_data';

import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_cputil_method_channel.dart';

abstract class FlutterCputilPlatform extends PlatformInterface {
  /// Constructs a FlutterCputilPlatform.
  FlutterCputilPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterCputilPlatform _instance = MethodChannelFlutterCputil();

  /// The default instance of [FlutterCputilPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterCputil].
  static FlutterCputilPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterCputilPlatform] when
  /// they register themselves.
  static set instance(FlutterCputilPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<Uint8List?> convert(String template) {
    throw UnimplementedError('convert() has not been implemented.');
  }
}
