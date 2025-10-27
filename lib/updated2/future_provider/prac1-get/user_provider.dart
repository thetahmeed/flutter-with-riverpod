import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'user.dart';

final userProvider = FutureProvider<List<User>>((ref) async {
  const url = 'https://jsonplaceholder.typicode.com/posts';

  try {
    print('Calling api');
    final response = await http.get(Uri.parse(url));
    final user = userFromJson(response.body.toString());
    return user;
  } on SocketException {
    throw 'No internet!';
  } catch (e) {
    print(e.toString());
    throw 'Internal server error!';
  }
});
