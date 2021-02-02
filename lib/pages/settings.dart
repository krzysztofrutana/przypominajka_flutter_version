import 'package:flutter/material.dart';
import 'package:przypominajka_flutter/pages/drawer.dart';

class Settings extends StatefulWidget {
  final String title;

  Settings({this.title});

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(widget.title)
      ),
      drawer: MyDrawer(),
      body: Text('Settings'),
    );
  }
}
