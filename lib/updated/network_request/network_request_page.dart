import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_with_riverpod/updated/network_request/model/activity.dart';
import 'package:flutter_with_riverpod/updated/network_request/provider/provider.dart';

class NetworkRequestPage extends ConsumerWidget {
  const NetworkRequestPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<Activity> activity = ref.watch(activityProvider('1'));

    return Scaffold(
      body: Center(
        child: activity.when(
          data: (value) => Text(value.title),
          loading: () => const CircularProgressIndicator(),
          error: (error, stackTrace) {
            log(error.toString());
            return const Text('Has errors');
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
