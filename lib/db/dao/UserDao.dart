import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../domain/user.dart';

class UserDao {
  final _baseUrl = 'https://saude-digital-14b47-default-rtdb.firebaseio.com';

  Future<void> insertUser(User user) async {
    await http.post(Uri.parse('$_baseUrl/user.json'),
        body: jsonEncode({
          'id': user.id,
          'name': user.name,
          'email': user.email,
          'birthDate': user.date,
          'password': user.password
        }));
  }
}
