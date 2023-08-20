import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../domain/user.dart';

class UserDao {
  final _baseUrl = 'https://saude-digital-14b47-default-rtdb.firebaseio.com';

  List<User> accounts = [
    UserBuilder()
        .withName('Tarsis Marinho')
        .withImage('assets/tarsis_sleepando.jpeg')
        .withDate('10/10/1982')
        .withUsername('@tarsis_marinheiro')
        .withEmail('tarsis@ifal.edu.br')
        .withDiseases(['Hipertensão, Diabetes']).build(),
  ];

  User userNull = UserBuilder()
      .withName('')
      .withImage('')
      .withDate('')
      .withUsername('')
      .withEmail('')
      .withDiseases([]).build();

  Future<void> insertUser(User user) async {
    await http.post(Uri.parse('$_baseUrl/user.json'),
        body: jsonEncode({
          'id': user.id,
          'name': user.name,
          'email': user.email,
          'birthDate': user.date,
          'password': user.password,
          'urlImage': user.urlImage,
          'donations': user.donations
        }));
  }

  Future<User> getInfoProfile(String username) async {
    await Future.delayed(const Duration(seconds: 3));
    for (int i = 0; i < accounts.length; i++) {
      if (accounts[i].username == username) {
        return accounts[i];
      }
    }
    return userNull;
  }

}
