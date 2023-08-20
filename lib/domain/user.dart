
import 'package:intl/intl.dart';

import 'donation.dart';

class User {
  late String _id;
  late String _name;
  late String _username;
  late String _email;
  late String _date;
  late String _password;
  late List<String> _diseases;
  late String _urlImage;
  late List<Donation> _donations;

  String get id => _id;
  String get name => _name;
  String get username => _username;
  String get email => _email;
  String get date => _date;
  String get password => _password;
  List<String> get diseases => _diseases;
  List<Donation> get donations => _donations;
  String get urlImage => _urlImage;

  User._({
    required String id,
    required String email,
    required String date,
    required String password,
    required String name,
    required String username,
    required String urlImage,
    required List<String> diseases
  }) {
    _id = id;
    _email = email;
    _date = date;
    _password = password;
    _username = username;
    _name = name;
    _urlImage = urlImage;
    _diseases = diseases;
  }

  int calculateAge() {
    DateTime currentDate = DateTime.now();
    DateTime birthDate = DateFormat('dd/MM/yyyy').parse(date);
    Duration difference = currentDate.difference(birthDate);
    int age = (difference.inDays / 365).floor();
    return age;
  }
}

class UserBuilder {
  late String _id;
  late String _name;
  late String _username;
  late String _email;
  late String _date;
  late String _password;
  late String _urlImage;
  late List<String> _diseases;

  UserBuilder() {
    _id = '';
    _name = '';
    _username = '';
    _email = '';
    _date = '';
    _password = '';
    _urlImage = '';
    _diseases = [];
  }

  UserBuilder withID(String id) {
    _id = id;
    return this;
  }

  UserBuilder withName(String name) {
    _name = name;
    return this;
  }

  UserBuilder withUsername(String username) {
    _username = username;
    return this;
  }

  UserBuilder withEmail(String email) {
    _email = email;
    return this;
  }

  UserBuilder withDate(String date) {
    _date = date;
    return this;
  }

  UserBuilder withPassword(String password) {
    _password = password;
    return this;
  }

  UserBuilder withImage(String urlImage) {
    _urlImage = urlImage;
    return this;
  }

  UserBuilder withDiseases(List<String> diseases) {
    _diseases = diseases;
    return this;
  }

  User build() {
    return User._(
      id: _id,
      email: _email,
      date: _date,
      password: _password,
      name: _name,
      username: _username,
      diseases: _diseases,
      urlImage: _urlImage
    );
  }
}