// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 01
class Todo {
  final String id;
  final String title;
  final String body;
  Todo({
    required this.id,
    required this.title,
    required this.body,
  });

  Todo copyWith({
    String? id,
    String? title,
    String? body,
  }) {
    return Todo(
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }
}

// 02
class TodoNotifier extends StateNotifier<List<Todo>> {
  TodoNotifier() : super([]);

  // Create
  void createTodo(String title, String body) {
    final item = Todo(id: DateTime.now().toString(), title: title, body: body);

    // Way 1
    // state.add(item); // modifies the existing list
    // state =
    //     state.toList(); // creates a new list to trigger Riverpod's state update

    // Way 2
    state = [...state, item];
    debugPrint('New todo saved');
  }

  // Delete
  void deleteTodo(String id) {
    state.removeWhere((element) => element.id == id);
    state = state.toList();
    debugPrint('Todo deleted');
  }

  // Update
  void updateTodo(String id, String? title, String? body) {
    int index = state.indexWhere((element) => element.id == id);
    state[index] = state[index].copyWith(title: title, body: body);

    state = state.toList();
    debugPrint('Todo updated');
  }
}

// 03
final todoProvider =
    StateNotifierProvider<TodoNotifier, List<Todo>>((ref) => TodoNotifier());

// View
class StateNotifierProviderPage2 extends ConsumerWidget {
  const StateNotifierProviderPage2({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoProvider);

    return Scaffold(
      body: todos.isEmpty
          ? const Center(child: Text('No todos found!'))
          : ListView.builder(
              shrinkWrap: true,
              itemCount: todos.length,
              itemBuilder: (context, index) {
                final item = todos[index];

                return ListTile(
                  leading: const Icon(Icons.today_rounded),
                  title: Text(item.title),
                  subtitle: Text(item.body),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          onPressed: () {
                            addUpdate(
                              context,
                              ref,
                              isAdd: false,
                              id: item.id,
                              preTitle: item.title,
                              preBody: item.body,
                            );
                          },
                          icon: const Icon(Icons.edit_rounded)),
                      IconButton(
                          onPressed: () {
                            ref.read(todoProvider.notifier).deleteTodo(item.id);
                          },
                          icon: const Icon(Icons.delete_rounded))
                    ],
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addUpdate(
            context,
            ref,
          );
        },
        child: const Icon(
          Icons.add_rounded,
        ),
      ),
    );
  }

  Future<dynamic> addUpdate(BuildContext context, WidgetRef ref,
      {bool isAdd = true, String? id, String? preTitle, String? preBody}) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        final title = TextEditingController(text: isAdd ? '' : preTitle ?? '');
        final body = TextEditingController(text: isAdd ? '' : preBody ?? '');

        return Container(
          padding: const EdgeInsets.all(18),
          height: 240,
          child: Column(
            children: [
              // For the title
              TextField(controller: title),

              // For the body
              TextField(controller: body),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  String titleText = title.text.trim();
                  String bodyText = body.text.trim();
                  if (isAdd) {
                    ref
                        .read(todoProvider.notifier)
                        .createTodo(titleText, bodyText);
                  } else {
                    ref
                        .read(todoProvider.notifier)
                        .updateTodo(id!, titleText, bodyText);
                  }

                  Navigator.pop(context);
                },
                child: Text(isAdd ? 'Save' : 'Update'),
              ),
            ],
          ),
        );
      },
    );
  }
}
