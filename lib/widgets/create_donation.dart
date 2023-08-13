import 'package:flutter/material.dart';

class CreateDonation extends StatefulWidget {

  final String donationName;
  final int quantity;
  final String location;

  const CreateDonation({Key? key, required this.quantity, required this.donationName, required this.location}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CreateDonationState();

}

class _CreateDonationState extends State<CreateDonation> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(
        Icons.health_and_safety_outlined,
        color: Colors.cyan,
        size: 30,
      ),
      title: Text('Nome da doação: ${widget.donationName}',
          style: const TextStyle(color: Colors.cyan, fontSize: 15)),
      subtitle: Text('Local da doação: ${widget.location}'),
      isThreeLine: true,
      onTap: () {},
      dense: true,
      trailing: Text('Quantidade: ${widget.quantity}',
          style: const TextStyle(color: Colors.cyan, fontSize: 15)),
    );
  }

}