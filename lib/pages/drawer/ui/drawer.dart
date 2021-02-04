import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:przypominajka_flutter/pages/drawer/bloc/drawer_bloc.dart';

class MyDrawer extends StatelessWidget {
  final List<_NavigationItem> _listNavigationItems = [
    _NavigationItem(true, false, null, null, null),
    _NavigationItem(false, true,NavigationItem.home, "Kalendarz", Icons.date_range),
    _NavigationItem(
        false, true,  NavigationItem.event_list, "Lista wydarzeń", Icons.event),
    _NavigationItem(
        false,false,  NavigationItem.settings, "Ustawienia", Icons.settings),
  ];

  @override
  Widget build(BuildContext context) => Drawer(
          child: Container(
        color: Colors.white,
        child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: _listNavigationItems.length,
            itemBuilder: (BuildContext context, int index) =>
                BlocBuilder<DrawerBloc, DrawerState>(
                  builder: (BuildContext context, DrawerState state) =>
                      _buildItem(_listNavigationItems[index], state),
                )),
      ));

  Widget _buildItem(_NavigationItem data, DrawerState state) => data.header
      // if the item is a header return the header widget
      ? _makeHeaderItem()
      // otherwise build and return the default list item
      : _makeListItem(data, state);

  Widget _makeHeaderItem() => DrawerHeader(
      decoration: BoxDecoration(color: Colors.blue),
      child: Stack(fit: StackFit.loose, children: <Widget>[
        Align(
          alignment: Alignment.centerLeft,
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/icons/logo.png'),
            radius: 50.0,
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Text('Krzysztof Rutana',
              style: TextStyle(color: Colors.white, fontSize: 20.0)),
        ),
        Align(
          alignment: Alignment.centerRight + Alignment(0, 0.3),
          child: Text("krzysztofrutana@wp.pl", style: TextStyle(color: Colors.white70),),
        )
      ]));

  Widget _makeListItem(_NavigationItem data, DrawerState state) => Card(
        color: data.item == state.selectedItem
            ? Colors.blue[200]
            : Colors.transparent,
        shape: ContinuousRectangleBorder(borderRadius: BorderRadius.zero),
        // So we see the selected highlight
        borderOnForeground: true,
        elevation: 0,
        margin: EdgeInsets.zero,
        child: Builder(
          builder: (BuildContext context) => ListTile(
            title: Text(
              data.title,
              style: TextStyle(
                color: Colors.black
              ),
            ),
            leading: Icon(
              data.icon,
              // if it's selected change the color
              color: Colors.black,
            ),
            onTap: () => _handleItemClick(context, data.item),
          ),
        ),
      );

  void _handleItemClick(BuildContext context, NavigationItem item) {
    BlocProvider.of<DrawerBloc>(context).add(NavigateTo(item));
    Navigator.pop(context);
  }
}

class _NavigationItem {
  final bool header;
  final bool fab;
  final NavigationItem item;
  final String title;
  final IconData icon;

  _NavigationItem(this.header, this.fab, this.item, this.title, this.icon);
}
