import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/menu_page.dart';
import 'package:flutter_application_2/widgets/create_donation.dart';

class DonationsView extends StatefulWidget {
  const DonationsView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DonationsViewState();
}

class _DonationsViewState extends State<DonationsView> {
  List<Widget> donationTiles = [];

  void addDonationTile() {
    setState(() {
      donationTiles.add(CreateDonation(quantity: 2, donationName: '', location: ''));
    });
  }

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
                Navigator.of(context).push(
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
              onPressed: addDonationTile,
              icon: const Icon(
                Icons.add,
              ))
        ],
      ),
      body: ListView(children: [
        Column(
          children: donationTiles,
        )
      ]),
    );
  }
}
