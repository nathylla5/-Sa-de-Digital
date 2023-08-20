class Donation {
  late String _name;
  late String _location;
  late int _numberOfItems;

  Donation._(
      {required String name,
      required String location,
      required int numberOfItems}) {
    _name = name;
    _location = location;
    _numberOfItems = numberOfItems;
  }

  String get name => _name;

  String get location => _location;

  int get numItems => _numberOfItems;
}

class DonationBuilder {
  late String _name;
  late String _location;
  late int _numberOfItems;

  DonationBuilder() {
    _name = '';
    _location = '';
    _numberOfItems = 0;
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
    _numberOfItems = items;
    return this;
  }

  Donation build() {
    return Donation._(
        name: _name, location: _location, numberOfItems: _numberOfItems);
  }
}
