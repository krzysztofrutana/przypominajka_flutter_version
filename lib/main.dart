import 'package:flutter/material.dart';
import 'package:przypominajka_flutter/pages/event_list.dart';
import 'package:przypominajka_flutter/pages/home.dart';
import 'package:przypominajka_flutter/pages/details.dart';
import 'package:przypominajka_flutter/pages/add.dart';
import 'package:przypominajka_flutter/pages/settings.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final appName = 'Przypominajka';
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/' : (context) => HomePage(title: 'Kalendarz'),
        '/events' : (context) => EventList(title: 'Lista wydarzeń'),
        '/details' :(context) => Details(),
        '/add' : (context) => AddEvent(),
        '/settings' :(context) => Settings(title: 'Ustawienia')
      },
      title: appName,
    );
  }
}



