import 'package:intl/intl.dart';

class User {
  late String _id;
  late String _name;
  late String _username;
  late String _email;
  late String _birthDate;
  late String _password;
  late String _diseases;
  late String _urlImage;

  String get id => _id;
  String get name => _name;
  String get username => _username;
  String get email => _email;
  String get birthDate => _birthDate;
  String get password => _password;
  String get diseases => _diseases;
  String get urlImage => _urlImage;

  User._({
    required String id,
    required String email,
    required String birthDate,
    required String password,
    required String name,
    required String username,
    required String urlImage,
    required String diseases
  }) {
    _id = id;
    _email = email;
    _birthDate = birthDate;
    _password = password;
    _username = username;
    _name = name;
    _urlImage = urlImage;
    _diseases = diseases;
  }

  User.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _username = json['username'];
    _birthDate = json['birthDate'];
    _password = json['password'];
    _urlImage = json['urlImage'];
    _email = json['email'];
    _diseases = json['diseases'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['username'] = this._username;
    data['birthDate'] = this._birthDate;
    data['password'] = this._password;
    data['urlImage'] = this._urlImage;
    data['email'] = this._email;
    data['diseases'] = this._diseases;
    return data;
  }

  int calculateAge() {
    DateTime currentDate = DateTime.now();
    DateTime? birthDt;
    try {
      birthDt = DateFormat('dd/MM/yyyy').parse(birthDate);
    } catch (e) {
      return 0;
    }

    Duration difference = currentDate.difference(birthDt);
    int age = (difference.inDays / 365).floor();
    return age;
  }
}

class UserBuilder {
  late String _id;
  late String _name;
  late String _username;
  late String _email;
  late String _birthDate;
  late String _password;
  late String _urlImage;
  late String _diseases;

  UserBuilder() {
    _id = '';
    _name = '';
    _username = '';
    _email = '';
    _birthDate = '';
    _password = '';
    _urlImage = '';
    _diseases = '';
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

  UserBuilder withDate(String birthDate) {
    _birthDate = birthDate;
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

  UserBuilder withDiseases(String diseases) {
    _diseases = diseases;
    return this;
  }

  User build() {
    return User._(
      id: _id,
      email: _email,
      birthDate: _birthDate,
      password: _password,
      name: _name,
      username: _username,
      diseases: _diseases,
      urlImage: _urlImage
    );
  }
}