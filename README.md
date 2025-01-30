# flutter-with-riverpod (UPDATED)

## Setup

1. Add these

```
flutter pub add flutter_riverpod
flutter pub add riverpod_annotation
flutter pub add dev:riverpod_generator
flutter pub add dev:build_runner
flutter pub add dev:custom_lint
flutter pub add dev:riverpod_lint
```

2. Run code generator

```
dart run build_runner watch
```

3. Enable lint
  Open `analysis_options.yaml` and add 

```
analyzer:
  plugins:
    - custom_lint
```

# flutter-with-riverpod (OLD 2.3.6)

## Setup

Replace runApp with

```
void main() {
  runApp(const ProviderScope(child: MyApp()));
}
```

## Uses

## Creating data:

## 1. Provider

```
// Provider is used to access immutable objects
final counter = Provider<int>((ref) {
  return 1;
});

```

## 2. StateProvider

```
// StateProvider is used to access simple mutable object
final counter2 = StateProvider<int>((ref) {
  return 100;
});
```

## 3. StateNotifierProvider

```
// StateNotifierProvider is used to access complex mutable objects
final counter3 = StateNotifierProvider<MyCounterProvider, int>((ref) {
  return MyCounterProvider();
});
```

## Getting data:

## 1. By extending ConsumerWidget

```
class HomePage extends ConsumerWidget {
...
...
  Widget build(BuildContext context, WidgetRef ref) {
    ...
    ...
     final counterData = ref.watch(counter);
     ...
     ...
     Text(
            '$counterData',
                ...
                ...)

  }
}
```

## 2. By Consumer widget

```
        Consumer(
              builder: (context, ref, child) {
                final counterData = ref.watch(counter);
                return Text(
                  '$counterData',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
```

## On StateFulWidget

`class HomePage3 extends ConsumerStatefulWidget {`

`ConsumerState<HomePage3> createState() => _HomePage3State();`

`class _HomePage3State extends ConsumerState<HomePage3> {`

```
// Inside build
    final counterData = ref.watch(counter);
    ...
    ...
     Text('$counterData');
...
```

```
// Inside init state
    // Here we used 'read' not 'watch'
    final counterData = ref.read(counter);
```

```
// Updating data if using 'StateProvider'
ref.read(counter2.notifier).state++;
// or
ref.read(counter2.notifier).update((state) {
            return state + 1;
});
// or
ref.read(counter2.notifier).update((state) => state + 1);
// To reset the sate
ref.invalidate(counter2);
// or
ref.refresh(counter2);
...
// Listen the changes (Inside build)
    ref.listen(
      counter2,
      (previous, next) {
        log('Previous: $previous');
        log('Next: $next');
      },
);
```

ref.watch() => Observe the state inside build method to update the widgets
ref.read() => To read the state onece

```
// If we use StateNotifierProvider
// StateNotifierProvider is used to access complex mutable objects
final counter3 = StateNotifierProvider<MyCounterProvider, int>((ref) {
  return MyCounterProvider();
});

// Our class
class MyCounterProvider extends StateNotifier<int> {
  // 248 as initial value
  MyCounterProvider() : super(248);

  void incrementCounter() {
    state++;
  }
}

// How to access data
final counterData3 = ref.watch(counter3);

// How to access functions
ref.read(counter3.notifier).incrementCounter();
```
