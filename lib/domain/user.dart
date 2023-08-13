import 'package:uuid/uuid.dart';

class User {
  final String id;
  final String name;
  final String email;
  final String date;
  final String password;

  User(
      {required this.id,
      required this.email,
      required this.date,
      required this.password,
      required this.name});
}
