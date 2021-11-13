import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:przypominajka_flutter/pages/add/bloc/add_bloc.dart';

import 'add_event_name_field.dart';

class AddEvent extends StatefulWidget {
  final String title = 'Dodaj wydarzenie';

  @override
  _AddEventState createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  final _eventNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          children: [
            AddEventNameField()
          ],
        ));
  }

  @override
  void dispose() {
    _eventNameController.dispose();
    super.dispose();
  }
}
