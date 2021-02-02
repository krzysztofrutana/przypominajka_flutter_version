import 'package:flutter/material.dart';
import 'package:przypominajka_flutter/pages/drawer.dart';
import 'package:przypominajka_flutter/utils/calendar_month_model.dart';

class HomePage extends StatefulWidget {
  final String title;

  HomePage({Key key, this.title}) : super(key: key);

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
              child: Text(monthmodel[i].day.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold)));
        } else {
          return Container(
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
        body: Column(children: <Widget>[
          Row(
            children: [
              IconButton(
                  icon: Icon(Icons.arrow_left),
                  onPressed: () {
                    setState(() {
                      currentDateInMonthModel = new DateTime(
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
                  child: Text(currentDateInMonthModel.month.toString())),
              TextButton(
                  onPressed: () {},
                  child: Text(currentDateInMonthModel.year.toString())),
              IconButton(
                  icon: Icon(Icons.arrow_right),
                  onPressed: () {
                    setState(() {
                      currentDateInMonthModel = new DateTime(
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
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                  children: _buildGridTileList(42)))
        ]));
  }
}
