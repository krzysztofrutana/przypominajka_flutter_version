import 'package:flutter/material.dart';

import 'package:przypominajka_flutter/pages/drawer.dart';

class EventList extends StatefulWidget {

  final String title;

  EventList({this.title});

  @override
  _EventListState createState() => _EventListState();
}

class _EventListState extends State<EventList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        drawer: MyDrawer(),
      body: Text('Lista wydarzeń'),
    );
  }
}
