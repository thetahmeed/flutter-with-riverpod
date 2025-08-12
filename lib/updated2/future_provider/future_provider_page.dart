import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final futureProvider = FutureProvider<String>((ref) async {
  await Future.delayed(const Duration(seconds: 1));
  // if (23 != 3) throw "Thre is an error";

  return DateTime.now().toString();
});

class FutureProviderPage extends ConsumerWidget {
  const FutureProviderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final futureValue = ref.watch(futureProvider);

    return Scaffold(
      body: Center(
        child: futureValue.when(
          skipLoadingOnRefresh: false,
          data: (data) => Text('Data: $data'),
          error: (error, stackTrace) => Text('Error: $error'),
          loading: () => const CircularProgressIndicator(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.invalidate(futureProvider);
        },
        child: const Icon(
          Icons.refresh_rounded,
        ),
      ),
    );
  }
}
