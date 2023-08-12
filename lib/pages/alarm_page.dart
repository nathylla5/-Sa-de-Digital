import 'package:flutter/material.dart';

class AlarmsView extends StatefulWidget {
  const AlarmsView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AlarmsViewState();
}

class _AlarmsViewState extends State<AlarmsView> {
  List<Widget> alarmsTiles = [];
  List<bool> switchValues = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        elevation: 0,
        title: const Text('Alarmes',
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
              onPressed: addAlarmsTile,
              icon: const Icon(
                Icons.add,
              ))
        ],
      ),
      body: ListView(children: [Column(children: alarmsTiles)]),
    );
  }

  void addAlarmsTile() {
    setState(() {
      switchValues.add(false);
      alarmsTiles.add(
        SwitchListTile(
          title: const Text('8:55 AM',
              style: TextStyle(color: Colors.cyan, fontSize: 15)),
          subtitle:
              const Text('ESTÁ NA HORA DO SEU REMÉDIO, (NOME DO REMÉDIO)'),
          isThreeLine: true,
          dense: true,
          value: switchValues[alarmsTiles.length],
          onChanged: (bool switchValue) {
            setState(() {
              switchValues[alarmsTiles.length] = switchValue;
            });
          },
        ),
      );
    });
  }
}
