import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_signal_strength/flutter_signal_strength.dart';

void main() {
  const MethodChannel channel = MethodChannel('flutter_signal_strength');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await FlutterSignalStrength.gsmSignalStrength, 42);
  });
}
