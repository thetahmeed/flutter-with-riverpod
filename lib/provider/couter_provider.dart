import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyCounterProvider extends StateNotifier<int> {
  // 248 as initial value
  MyCounterProvider() : super(248);

  void incrementCounter() {
    state++;
  }
}
