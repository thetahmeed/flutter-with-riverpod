import 'package:flutter/material.dart';

class SimpleProviderScreen extends StatelessWidget {
  const SimpleProviderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Simple Provider',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
