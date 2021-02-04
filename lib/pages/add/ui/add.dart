import 'package:flutter/material.dart';
import 'file:///D:/Dysk%20Google/Projekty/Flutter/przypominajka_flutter/lib/pages/drawer/ui/drawer.dart';

class AddEvent extends StatefulWidget {

  final String title = 'Dodaj wydarzenie';

  @override
  _AddEventState createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Text('Add'),
    );
  }
}
