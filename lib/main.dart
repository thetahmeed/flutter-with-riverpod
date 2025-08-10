import 'package:flutter/material.dart';
import 'updated2/simple_provider/simple_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter with Riverpod',
      home: SimpleProviderScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
