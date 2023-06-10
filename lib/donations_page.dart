import 'package:flutter/material.dart';

class DonationsView extends StatefulWidget {
  const DonationsView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DonationsViewState();
}

class _DonationsViewState extends State<DonationsView> {
  List<Widget> donationTiles = [];

  void addDonationTile() {
    setState(() {
      donationTiles.add(ListTile(
        leading: const Icon(
          Icons.health_and_safety_outlined,
          color: Colors.cyan,
          size: 30,
        ),
        title: const Text('Nome da doação',
            style: TextStyle(color: Colors.cyan, fontSize: 15)),
        subtitle: const Text('Local da doação'),
        isThreeLine: true,
        onTap: () {},
        dense: true,
        trailing: const Text('Quantidade',
            style: TextStyle(color: Colors.cyan, fontSize: 15)),
      ));
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
              onPressed: () {},
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
