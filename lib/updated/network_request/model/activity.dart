import 'package:freezed_annotation/freezed_annotation.dart';

part 'activity.freezed.dart';
part 'activity.g.dart';

/// The response of the `GET https://jsonplaceholder.typicode.com/todos/1` endpoint.
///
/// It is defined using `freezed` and `json_serializable`.
/// {
///   "userId": 1,
///   "id": 1,
///   "title": "delectus aut autem",
///   "completed": false
/// }
///
/// Documentation: https://pub.dev/packages/freezed

@freezed
class Activity with _$Activity {
  factory Activity({
    required int userId,
    required int id,
    required String title,
    required bool completed,
  }) = _Activity;

  /// Convert a JSON object into an [Activity] instance.
  /// This enables type-safe reading of the API response.
  /// hello
  factory Activity.fromJson(Map<String, dynamic> json) =>
      _$ActivityFromJson(json);
}
