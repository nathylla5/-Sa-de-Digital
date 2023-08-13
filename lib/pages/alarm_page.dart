import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/create_alarm.dart';

import 'menu_page.dart';

class AlarmsView extends StatefulWidget {
  const AlarmsView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AlarmsViewState();
}

class _AlarmsViewState extends State<AlarmsView> {
  List<Widget> alarmsTiles = [];

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
      alarmsTiles
          .add(const CreateAlarm(time: '22:00 AM', medicineName: 'GRIPEX'));
    });
  }
}
