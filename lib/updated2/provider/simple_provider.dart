import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 1. Create a simple provider (Unchangable)
final simpleProvider = Provider<String>((ref) => 'Hello, Riverpod!');

class SimpleProviderScreen extends ConsumerWidget {
  const SimpleProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 2. Use the provider to get the value
    final message = ref.watch(simpleProvider);

    return Scaffold(
      body: Center(
        child: Text(
          // 3. Display the value in the UI
          message,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
