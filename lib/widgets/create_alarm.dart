import 'package:flutter/material.dart';

class CreateAlarm extends StatefulWidget {
  final String time;
  final String medicineName;

  const CreateAlarm({Key? key, required this.time, required this.medicineName})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _CreateAlarmState();
}

class _CreateAlarmState extends State<CreateAlarm> {
  bool switchValue = false;
  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Text(widget.time,
          style: const TextStyle(color: Colors.cyan, fontSize: 15)),
      subtitle: Text('ESTÁ NA HORA DO SEU REMÉDIO: ${widget.medicineName}'),
      isThreeLine: true,
      dense: true,
      value: switchValue,
      onChanged: (bool value) {
        setState(() {
          switchValue = value;
        });
      },
    );
  }
}
