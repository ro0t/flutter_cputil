
import 'dart:typed_data';

import 'flutter_cputil_platform_interface.dart';

class FlutterCputil {
  Future<Uint8List?> convert(String template) {
    return FlutterCputilPlatform.instance.convert(template);
  }
}
