// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 01
final stateProvider = StateProvider<int>((ref) => 0);

// ---------------- Way 1: Updating full screen
/*class StateProviderScreen extends ConsumerWidget {
  const StateProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('Updating build');
    // 02
    final message = ref.watch(stateProvider);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              // 03
              message.toString(),
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // 04
                ref.read(stateProvider.notifier).state++;
              },
              child: const Text('Update State'),
            ),
          ],
        ),
      ),
    );
  }
}*/

// --------------- Way 2: Updating only text
/*class StateProviderScreen extends ConsumerWidget {
  const StateProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('Updating build');
    // 02
    //final message1 = ref.watch(stateProvider);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer(
              builder: (context, ref, child) {
                print('Updating text');
                final message2 = ref.watch(stateProvider);
                return Text(
                  message2.toString(),
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),
            // Way 1: Updating full screen
            // Text(
            //   // 03
            //   message1.toString(),
            //   style: const TextStyle(
            //     fontSize: 24,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // 04
                ref.read(stateProvider.notifier).state++;
              },
              child: const Text('Update State'),
            ),
          ],
        ),
      ),
    );
  }
}*/

final mySwitch = StateProvider<bool>((ref) => false);

// The Switch Practice
/*class StateProviderScreen extends ConsumerWidget {
  const StateProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer(
              builder: (context, ref, child) {
                final value = ref.watch(mySwitch);

                return Switch.adaptive(
                  value: value,
                  onChanged: (val) {
                    ref.read(mySwitch.notifier).state = val;
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
*/

final sliderStateProvider = StateProvider<double>((ref) => 0.2);

// The Slider Practice

/*class StateProviderScreen extends ConsumerWidget {
  const StateProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('Updating build');

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer(builder: (context, ref, child) {
              final sliderValue = ref.watch(sliderStateProvider);
              print('Updating container');
              return Opacity(
                opacity: sliderValue,
                child: Container(
                  height: 300,
                  width: 300,
                  color: Colors.red,
                ),
              );
            }),
            const SizedBox(height: 10),
            Consumer(builder: (context, ref, child) {
              final sliderValue = ref.watch(sliderStateProvider);
              print('Updating slider');
              return Slider(
                value: sliderValue,
                onChanged: (val) {
                  ref.watch(sliderStateProvider.notifier).state = val;
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
*/

// Multiple Small States
final multipleStates = StateProvider<MultipleSmallStates>(
    (ref) => MultipleSmallStates(isActive: false, isChecked: false));

class StateProviderScreen extends StatelessWidget {
  const StateProviderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print('Build');

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer(
              builder: (context, ref, child) {
                final states =
                    ref.watch(multipleStates.select((state) => state.isActive));
                print('Switch');

                return Switch.adaptive(
                    value: states,
                    onChanged: (val) {
                      final active = ref.read(multipleStates.notifier);
                      active.state = active.state.copyWith(isActive: val);
                    });
              },
            ),
            const SizedBox(height: 10),
            Consumer(
              builder: (context, ref, child) {
                final states = ref
                    .watch(multipleStates.select((state) => state.isChecked));
                print("Checkbox");
                return Checkbox.adaptive(
                    value: states,
                    onChanged: (val) {
                      final checkbox = ref.read(multipleStates.notifier);

                      checkbox.state = checkbox.state.copyWith(isChecked: val);
                    });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MultipleSmallStates {
  final bool isActive;
  final bool isChecked;

  MultipleSmallStates({
    required this.isActive,
    required this.isChecked,
  });

  MultipleSmallStates copyWith({
    bool? isActive,
    bool? isChecked,
  }) {
    return MultipleSmallStates(
      isActive: isActive ?? this.isActive,
      isChecked: isChecked ?? this.isChecked,
    );
  }
}
