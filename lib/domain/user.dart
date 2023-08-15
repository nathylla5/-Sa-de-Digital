import 'package:uuid/uuid.dart';

class User {
  final String id;
  final String name;
  final String email;
  final String date;
  final String password;
  final String usuario;

  User(
      {required this.id,
      required this.email,
      required this.date,
      required this.password,
      required this.name,
      required this.usuario});
}
