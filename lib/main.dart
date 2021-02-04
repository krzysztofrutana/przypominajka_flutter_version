import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:przypominajka_flutter/pages/drawer/bloc/drawer_bloc.dart';
import 'package:przypominajka_flutter/pages/home/ui/home.dart';
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

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(value: DrawerBloc(), child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appName,
      navigatorKey: NavigationService.instance.navigationKey,
      home: HomePage(),
    ),);
  }
}

