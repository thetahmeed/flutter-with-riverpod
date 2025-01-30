import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Old imports
import 'package:flutter_with_riverpod/provider/couter_provider.dart';
import 'package:flutter_with_riverpod/ui/home/home_page.dart';
import 'package:flutter_with_riverpod/updated/network_request/network_request_page.dart';
import 'package:flutter_with_riverpod/updated/todo_list/todo_list_page.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter with Riverpod',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      // home: const RiverpodHelloWorld(),
      // home: const NetworkRequestPage(),
      home: const TodoListPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// OLD Riverpod code
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_with_riverpod/provider/couter_provider.dart';
// import 'package:flutter_with_riverpod/ui/home/home_page.dart';

// void main() {
//   runApp(const ProviderScope(child: MyApp()));
// }

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

class MyAppOld extends StatelessWidget {
  const MyAppOld({super.key});

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
