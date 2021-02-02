import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Przypominajka'),
            decoration: BoxDecoration(color: Colors.blue),
          ),
          ListTile(
            title: Text('Kalendarz'),
            onTap: (){
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
          ListTile(
            title: Text('Zapisane wydarzenia'),
            onTap: (){
              Navigator.pushReplacementNamed(context, '/events');
            },
          ),
          ListTile(
            title: Text('Ustawienia'),
            onTap: (){
              Navigator.pushReplacementNamed(context, '/settings');
            },
          )
        ],
      ),
    );
  }
}
