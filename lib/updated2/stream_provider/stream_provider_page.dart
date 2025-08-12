import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final streamProvider = StreamProvider<double>((ref) async* {
  final random = Random();

  double currentPrice = 100;

  while (true) {
    await Future.delayed(const Duration(seconds: 1));
    currentPrice +=
        random.nextDouble() * 4 - 2; // Random change between -2 and +2
    yield double.parse(currentPrice.toStringAsFixed(2));
  }
});

class StreamProviderPage extends ConsumerWidget {
  const StreamProviderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Consumer(
          builder: (context, ref, child) {
            final livePrice = ref.watch(streamProvider);
            return livePrice.when(
              data: (data) => Text(
                data.toStringAsFixed(2),
                style: const TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
              ),
              error: (error, stackTrace) => Text('Error: $error'),
              loading: () => const CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
