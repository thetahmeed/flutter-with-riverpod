import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_with_riverpod/provider/couter_provider.dart';
import 'package:flutter_with_riverpod/ui/home/home_page.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

// Provider is used to access immutable objects
final counter = Provider<int>((ref) {
  return 99;
});

// StateProvider is used to access simple mutable objects
final counter2 = StateProvider<int>((ref) {
  return 100;
});

// StateNotifierProvider is used to access complex mutable objects
final counter3 = StateNotifierProvider<MyCounterProvider, int>((ref) {
  return MyCounterProvider();
});

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter with Riverpod',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
