import 'dart:async';

class Debouncer {
  Debouncer(this._duration);

  final Duration _duration;
  Timer? _timer;

  void debounce(Function() action) {
    if (_timer?.isActive ?? false) {
      _timer?.cancel();
    }
    _timer = Timer(_duration, action);
  }
}
