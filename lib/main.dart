import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'ui/home/home_page2.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

// Provider is used to access immutable objects
final counter = Provider<int>((ref) {
  return 99;
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
      home: const HomePage2(),
      debugShowCheckedModeBanner: false,
    );
  }
}
