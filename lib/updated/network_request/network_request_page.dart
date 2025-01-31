import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_with_riverpod/updated/network_request/model/activity.dart';
import 'package:flutter_with_riverpod/updated/network_request/provider/provider.dart';

class NetworkRequestPage extends ConsumerWidget {
  const NetworkRequestPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final id = ref.watch(idNotifierProvider);
    final AsyncValue<Activity> activity = ref.watch(activityProvider(id));

    return Scaffold(
      body: Center(
        child: activity.when(
          data: (value) => Padding(
            padding: const EdgeInsets.all(28.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(value.id.toString()),
                Text(value.title),
                Text(value.completed.toString()),
              ],
            ),
          ),
          loading: () => const CircularProgressIndicator(),
          error: (error, stackTrace) {
            log(error.toString());
            return const Text('Has errors');
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //ref.read(idNotifierProvider.notifier).increment();
          ref.read(idNotifierProvider.notifier).getId(2);
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
