import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../main.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counterData = ref.watch(counter);
    final counterData2 = ref.watch(counter2);

    // Listen the changes
    ref.listen(
      counter2,
      (previous, next) {
        log('Previous: $previous');
        log('Next: $next');
      },
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Roverpod!'),
        actions: [
          IconButton(
            onPressed: () {
              // To reset the sate
              ref.invalidate(counter2);
              // or
              ref.refresh(counter2);
            },
            icon: const Icon(
              Icons.restore_rounded,
            ),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$counterData2',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add_rounded),
        onPressed: () {
          // ref.read(counter2.notifier).state++;
          //or
          ref.read(counter2.notifier).update((state) {
            return state + 1;
          });
          // or
          //ref.read(counter2.notifier).update((state) => state + 1);
        },
      ),
    );
  }
}
