import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:przypominajka_flutter/pages/drawer/bloc/drawer_bloc.dart';
import 'package:przypominajka_flutter/pages/drawer/ui/drawer.dart';

class EventList extends StatefulWidget {

  final String title = 'Lista wydarzeń';

  static Widget getfloatingButton() {
    return FloatingActionButton(child: Icon(Icons.add),
        backgroundColor: Colors.green, onPressed: () {});
  }

  @override
  _EventListState createState() => _EventListState();
}

class _EventListState extends State<EventList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(child: Icon(Icons.add),
          backgroundColor: Colors.green, onPressed: () {
            BlocProvider.of<DrawerBloc>(context).add(NavigateTo(NavigationItem.add));
          }),
      drawer: MyDrawer(),
      appBar: AppBar(title: Text(widget.title),),
      body :Text('Lista wydarzeń'),
    );
  }
}
