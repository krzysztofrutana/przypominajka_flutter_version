import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:przypominajka_flutter/pages/add/bloc/add_bloc.dart';
import 'package:przypominajka_flutter/pages/add/bloc/add_event_name_bloc.dart';
import 'package:przypominajka_flutter/pages/drawer/bloc/drawer_bloc.dart';
import 'package:przypominajka_flutter/pages/home/ui/home.dart';
import 'package:przypominajka_flutter/repositories/event_repositories.dart';
import 'package:przypominajka_flutter/services/NavigatorServices.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final appName = 'Przypominajka';
  EventRepositories eventRepositories;

  @override
  void initState() {
    eventRepositories = EventRepositories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<AddBloc>(
        create: (BuildContext context) => AddBloc(eventRepositories),
      ),
      BlocProvider<AddEventNameBloc>(
        create: (BuildContext context) => AddEventNameBloc(eventRepositories),
      ),
      BlocProvider<DrawerBloc>(
        create: (BuildContext context) => DrawerBloc(),
      ),
    ], child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appName,
      navigatorKey: NavigationService.instance.navigationKey,
      home: HomePage(),
    ));
  }
}

