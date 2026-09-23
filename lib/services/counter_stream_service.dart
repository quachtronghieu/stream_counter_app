import 'dart:async';

class CounterStreamService {
  final StreamController<int> _controller = StreamController<int>();
  late final Timer _timer;
  int _count = 0;

  CounterStreamService() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _count++;
      _controller.add(_count);
    });
  }

  Stream<int> get stream => _controller.stream;

  void dispose() {
    _timer.cancel();
    _controller.close();
  }
}
