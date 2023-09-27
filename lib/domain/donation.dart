class Donation {
  late String _name;
  late String _location;
  late int _numItems;

  Donation._(
      {required String name,
      required String location,
      required int numItems}) {
    _name = name;
    _location = location;
    _numItems = numItems;
  }

  Donation.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    _location = json['location'];
    _numItems = json['numItems'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = _name;
    data['location'] = _location;
    data['numItems'] = _numItems;

    return data;
  }


  String get name => _name;

  String get location => _location;

  int get numItems => _numItems;
}

class DonationBuilder {
  late String _name;
  late String _location;
  late int _numItems;

  DonationBuilder() {
    _name = '';
    _location = '';
    _numItems = 0;
  }

  DonationBuilder withName(String name) {
    _name = name;
    return this;
  }

  DonationBuilder withLocation(String location) {
    _location = location;
    return this;
  }

  DonationBuilder withNumItems(int items) {
    _numItems = items;
    return this;
  }

  Donation build() {
    return Donation._(
        name: _name,
        location: _location,
        numItems: _numItems);
  }
}
