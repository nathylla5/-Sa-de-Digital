
import '../../domain/donation.dart';

class DonationDao {
  static List<Donation> donations = [
    DonationBuilder().withLocation('Hospital X').withNumItems(30).withName('Remédio X').build(),
    DonationBuilder().withLocation('Hospital Y').withNumItems(40).withName('Remédio Y').build(),
    DonationBuilder().withLocation('Hospital Z').withNumItems(50).withName('Remédio Z').build()
  ];

  Future<void> addDonation(Donation newDonation) async {
    await Future.delayed(const Duration(seconds: 2));
    donations.add(newDonation);
  }

  Future<List<Donation>> findAll() async {
    await Future.delayed(const Duration(seconds: 2));
    return donations;
  }
}
