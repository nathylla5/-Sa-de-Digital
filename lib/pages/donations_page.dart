import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/menu_page.dart';
import 'package:flutter_application_2/widgets/create_donation.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../db/dao/donation_dao.dart';
import '../domain/donation.dart';
import '../widgets/location_input.dart';

class DonationsView extends StatefulWidget {
  const DonationsView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DonationsViewState();
}

class _DonationsViewState extends State<DonationsView> {
  Future<List<Donation>> futureDonations = DonationDao().findAll();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        elevation: 0,
        title: const Text('Doações',
            style: TextStyle(color: Colors.cyan, fontSize: 25)),
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: Container(
          margin: const EdgeInsets.only(left: 16),
          child: IconButton(
              iconSize: 40,
              color: Colors.cyan,
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const MenuView()),
                );
              },
              icon: const Icon(
                Icons.arrow_back_ios,
              )),
        ),
        actions: [
          IconButton(
              color: Colors.cyan,
              iconSize: 25,
              onPressed: onPressed,
              icon: const Icon(
                Icons.add,
              ))
        ],
      ),
      body: FutureBuilder<List<Donation>>(
        future: futureDonations,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Donation> donations = snapshot.data!;

            return ListView.builder(
              itemCount: donations.length,
              itemBuilder: (context, index) {
                return CreateDonation(donation: donations[index]);
              },
            );
          }

          return const Padding(
            padding: EdgeInsets.only(top: 50),
            child: Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }

  Future<void> onPressed() async {

    List<Location> locations = await locationFromAddress('ARAPIRACA, BRA');
    LatLng latLng = LatLng(locations[0].latitude, locations[0].longitude);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return MapPage(latLng: latLng);
        },
      ),
    );
  }
}
