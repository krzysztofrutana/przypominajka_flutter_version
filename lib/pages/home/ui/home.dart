import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:przypominajka_flutter/pages/add/ui/add.dart';
import 'package:przypominajka_flutter/pages/drawer/bloc/drawer_bloc.dart';
import 'package:przypominajka_flutter/pages/drawer/ui/drawer.dart';
import 'package:przypominajka_flutter/services/NavigatorServices.dart';
import 'package:przypominajka_flutter/utils/calendar_month_model.dart';
import 'package:przypominajka_flutter/helpers/datetime_helper.dart';

class HomePage extends StatefulWidget {
  final String title = "Kalendarz";

  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<DateTime> monthmodel;
  DateTime currentDateInMonthModel;

  @override
  void initState() {
    // TODO: implement initState
    currentDateInMonthModel = DateTime.now();
    super.initState();
  }

  List<Container> _buildGridTileList(int count) => List.generate(count, (i) {
        if (monthmodel[i].day >= 1 &&
            monthmodel[i].day <= 31 &&
            monthmodel[i].month == monthmodel[20].month) {
          return Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                ),
              ),
              alignment: Alignment.center,
              child: Text(monthmodel[i].day.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold)));
        } else {
          return Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                ),
              ),
              alignment: Alignment.center,
              child: Text(monthmodel[i].day.toString(),
                  textAlign: TextAlign.center));
        }
      });

  @override
  Widget build(BuildContext context) {
    monthmodel =
        MonthModelBuild(dateTime: currentDateInMonthModel).buildModel();
    currentDateInMonthModel = monthmodel[20];
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: MyDrawer(),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Colors.green,
          onPressed: () {
            BlocProvider.of<DrawerBloc>(context)
                .add(NavigateTo(NavigationItem.add));
          }),
      body: Column(children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                icon: Icon(Icons.arrow_left),
                onPressed: () {
                  setState(() {
                    currentDateInMonthModel = DateTime(
                        currentDateInMonthModel.year,
                        currentDateInMonthModel.month - 1,
                        currentDateInMonthModel.day);
                    monthmodel =
                        MonthModelBuild(dateTime: currentDateInMonthModel)
                            .buildModel();
                  });
                }),
            TextButton(
                onPressed: () {},
                child: Text(DateTimeHelper.getMonthName(
                    currentDateInMonthModel.month))),
            TextButton(
                onPressed: () {},
                child: Text(currentDateInMonthModel.year.toString())),
            IconButton(
                icon: Icon(Icons.arrow_right),
                onPressed: () {
                  setState(() {
                    currentDateInMonthModel = DateTime(
                        currentDateInMonthModel.year,
                        currentDateInMonthModel.month + 1,
                        currentDateInMonthModel.day);
                    monthmodel =
                        MonthModelBuild(dateTime: currentDateInMonthModel)
                            .buildModel();
                  });
                }),
          ],
        ),
        new Expanded(
            child: GridView.count(
                crossAxisCount: 7,
                padding: const EdgeInsets.all(4),
                mainAxisSpacing: 0,
                crossAxisSpacing: 0,
                children: _buildGridTileList(42)))
      ]),
    );
  }
}
