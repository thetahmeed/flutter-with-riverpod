import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../main.dart';

class HomePage3 extends ConsumerStatefulWidget {
  const HomePage3({super.key});

  @override
  ConsumerState<HomePage3> createState() => _HomePage3State();
}

class _HomePage3State extends ConsumerState<HomePage3> {
  @override
  Widget build(BuildContext context) {
    final counterData = ref.watch(counter);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Roverpod!3'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$counterData',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
    );
  }
}
