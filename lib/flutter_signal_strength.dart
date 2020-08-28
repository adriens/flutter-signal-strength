
import 'dart:async';

import 'package:flutter/services.dart';

class FlutterSignalStrength {
  static const MethodChannel _channel =
      const MethodChannel('flutter_signal_strength');

  static Future<int> get gsmSignalStrength async {
    final int version = await _channel.invokeMethod('getGsmSignalStrength');
    return version;
  }
}
