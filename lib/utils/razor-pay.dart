import 'dart:async';
 import 'dart:js' as js;
import 'package:universal_html/html.dart' as html;
import 'dart:convert';

class RazorPayWeb {
  Timer? _timer;
  Timer? _paymentTimer;
  final _timerDuration = const Duration(seconds: 1);

  Future<Map<String, dynamic>> checkout(Map<String, dynamic> options) async {
    Completer<Map<String, String>> completer = Completer<Map<String, String>>();
    js.context.callMethod('checkout', [jsonEncode(options)]); //TODO uncomment for web

    _timer = Timer.periodic(_timerDuration, (timer) {
      bool status = html.window.sessionStorage.containsKey('razorpayStatus');

      if (status) {
        Map<String, String> data = Map.fromEntries(
          html.window.sessionStorage.entries,
        );
        html.window.sessionStorage.clear();
        completer.complete(data);
        _timer?.cancel();
        _paymentTimer?.cancel();
        _timer = null;
        _paymentTimer = null;
      }
    });

    _paymentTimer = Timer.periodic(const Duration(minutes: 2), (timer) {
      _timer?.cancel();
      _timer = null;
      _paymentTimer?.cancel();
      _paymentTimer = null;
    });

    return completer.future;
  }
}
