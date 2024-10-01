import 'package:flutter/services.dart';

class MethodChannelCounter {
  static MethodChannel methodChannel = const MethodChannel("methodChannelDemo");

  static Future<int> increment({required int counterValue}) async {
    final result = await methodChannel.invokeMethod<int>("increment", {"value": counterValue});
    return result!;
  }

  static Future<int> decrement({required int counterValue}) async {
    final result = await methodChannel.invokeMethod("decrement", {"value": counterValue});
    return result!;
  }
}
