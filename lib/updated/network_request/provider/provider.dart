import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../model/activity.dart';

part 'provider.g.dart';

@riverpod
class IdNotifier extends _$IdNotifier {
  @override
  int build() => 1;

  void increment() {
    state++;
  }

  void getId(int id) {
    state = id;
  }
}

@riverpod
Future<Activity> activity(Ref ref, int id) async {
  final response =
      await http.get(Uri.https('jsonplaceholder.typicode.com', '/todos/$id'));

  final json = jsonDecode(response.body) as Map<String, dynamic>;

  return Activity.fromJson(json);
}
