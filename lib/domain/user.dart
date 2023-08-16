class User {
  late String _id;
  late String _name;
  late String _email;
  late String _date;
  late String _password;
  late List<String> _diseases;
  late String _urlImage;
  // late List<Donate> donations;
  // late List<Alarms> alarms;

  String get id => _id;
  String get name => _name;
  String get email => _email;
  String get date => _date;
  String get password => _password;
  List<String> get diseases => _diseases;
  String get urlImage => _urlImage;

  User._({
    required String id,
    required String email,
    required String date,
    required String password,
    required String name,
  }) {
    _id = id;
    _email = email;
    _date = date;
    _password = password;
    _name = name;
  }
}

class UserBuilder {
  late String _id;
  late String _name;
  late String _email;
  late String _date;
  late String _password;

  UserBuilder() {
    _id = '';
    _name = '';
    _email = '';
    _date = '';
    _password = '';
  }

  UserBuilder withID(String id) {
    _id = id;
    return this;
  }

  UserBuilder withName(String name) {
    _name = name;
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


  User build() {
    return User._(
      id: _id,
      email: _email,
      date: _date,
      password: _password,
      name: _name,
    );
  }
}