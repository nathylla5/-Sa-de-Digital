import 'package:flutter/material.dart';
import '../domain/donation.dart';

class CreateDonation extends StatefulWidget {
  final Donation donation;

  const CreateDonation({Key? key, required this.donation}) : super(key: key);

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
      title: Text('Nome da doação: ${widget.donation.name}',
          style: const TextStyle(color: Colors.cyan, fontSize: 15)),
      subtitle: Text('Local da doação: ${widget.donation.location}'),
      isThreeLine: true,
      onTap: () {
      },
      //dense: true,
      trailing: Text('Quantidade: ${widget.donation.numItems}',
          style: const TextStyle(color: Colors.cyan, fontSize: 15)),
    );
  }
}
