import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_cputil/flutter_cputil.dart';
import 'package:flutter_cputil/flutter_cputil_platform_interface.dart';
import 'package:flutter_cputil/flutter_cputil_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterCputilPlatform
    with MockPlatformInterfaceMixin
    implements FlutterCputilPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterCputilPlatform initialPlatform = FlutterCputilPlatform.instance;

  test('$MethodChannelFlutterCputil is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterCputil>());
  });

  test('getPlatformVersion', () async {
    FlutterCputil flutterCputilPlugin = FlutterCputil();
    MockFlutterCputilPlatform fakePlatform = MockFlutterCputilPlatform();
    FlutterCputilPlatform.instance = fakePlatform;

    expect(await flutterCputilPlugin.getPlatformVersion(), '42');
  });
}
