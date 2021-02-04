import 'package:flutter/material.dart';
import 'package:przypominajka_flutter/pages/drawer/ui/drawer.dart';

class Settings extends StatefulWidget {


  final String title = 'Ustawienia';

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(),
      body: Text('Settings'),
    );
  }
}
