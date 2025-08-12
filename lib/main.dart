import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_with_riverpod/updated2/future_provider/future_provider_page.dart';
import 'updated2/state_notifier_provider/state_notifier_provider3/state_notifier_provider_page3.dart';

void main() {
  // 0. Wrap the app with ProviderScope
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter with Riverpod',
      // home: SimpleProviderScreen(),
      // home: StateProviderScreen(),
      // home: StateNotifierProviderPage(),
      // home: StateNotifierProviderPage3(),
      home: FutureProviderPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
