import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'riverpod_hello_world.g.dart';

@riverpod
String helloWorld(Ref ref) {
  return 'Hello World';
}

class RiverpodHelloWorld extends ConsumerWidget {
  const RiverpodHelloWorld({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(helloWorldProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Hello World with Riverpod'),
      ),
      body: Center(
        child: Text(data),
      ),
    );
  }
}
