// This is a basic Flutter integration test.
//
// Since integration tests run in a full Flutter application, they can interact
// with the host side of a plugin implementation, unlike Dart unit tests.
//
// For more information about Flutter integration tests, please see
// https://docs.flutter.dev/cookbook/testing/integration/introduction


import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:flutter_cputil/flutter_cputil.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('conert test', (WidgetTester tester) async {
    final FlutterCputil plugin = FlutterCputil();
    final Uint8List? bytes = await plugin.convert("Template");
    // The version string depends on the host platform running the test, so
    // just assert that some non-empty string is returned.
    expect(bytes?.isNotEmpty, true);
  });
}
