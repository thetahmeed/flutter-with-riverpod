import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'updated2/state_provider/state_provider.dart';

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
      home: StateProviderScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
