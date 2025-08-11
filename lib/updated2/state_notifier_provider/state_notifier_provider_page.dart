// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// For complex state management
// Needs 1. State Notifier, 2. State
final searchProvider =
    StateNotifierProvider<SearchNotifier, MyStates>((ref) => SearchNotifier());

// State Notifier
class SearchNotifier extends StateNotifier<MyStates> {
  SearchNotifier() : super(MyStates(query: 'Empty', isChecked: false));

  void search(String query) {
    state = state.copyWith(query: query);
  }

  void changeChecked(bool val) {
    state = state.copyWith(isChecked: val);
  }
}

// State
class MyStates {
  final String query;
  final bool isChecked;

  MyStates({required this.query, required this.isChecked});

  MyStates copyWith({
    String? query,
    bool? isChecked,
  }) {
    return MyStates(
      query: query ?? this.query,
      isChecked: isChecked ?? this.isChecked,
    );
  }
}

// View
class StateNotifierProviderPage extends ConsumerWidget {
  const StateNotifierProviderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('Build');
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Consumer(
                builder: (context, ref, child) {
                  final myState =
                      ref.watch(searchProvider.select((state) => state.query));
                  print('Text');
                  return Text(
                    myState,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  );
                },
              ),
              const SizedBox(height: 10),
              TextField(
                decoration: const InputDecoration(border: OutlineInputBorder()),
                onChanged: (val) {
                  ref.read(searchProvider.notifier).search(val);
                },
              ),
              const SizedBox(height: 10),
              Consumer(
                builder: (context, ref, child) {
                  final myState = ref
                      .watch(searchProvider.select((state) => state.isChecked));
                  print('Checkbox');
                  return Switch.adaptive(
                    value: myState,
                    onChanged: (val) {
                      ref.read(searchProvider.notifier).changeChecked(val);
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
