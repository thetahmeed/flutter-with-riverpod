import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../model/todo_model.dart';

part 'todo_provider.g.dart';

// A Notifier with no method outside of build is identical to
// using the previously seen syntax.
// The syntax shown in Make your first provider/network request
// can be considered as a shorthand for notifiers with
// no way to be modified from the UI.

// @riverpod
// Future<List<TodoModel>> getTodos(Ref ref) async {
//   return [
//     TodoModel(description: 'Buy eggs', completed: true),
//     TodoModel(description: 'Buy bread', completed: false),
//   ];
// }

@riverpod
class TodoProviderNotifier extends _$TodoProviderNotifier {
  @override
  Future<List<TodoModel>> build() async {
    return [
      TodoModel(description: 'Buy eggs', completed: true),
      TodoModel(description: 'Buy bread', completed: false),
    ];
  }
}
