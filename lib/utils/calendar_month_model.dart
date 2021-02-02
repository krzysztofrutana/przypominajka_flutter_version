class MonthModelBuild {
  DateTime dateTime;
  DateTime firstDayOfMonth;
  int firstDayOfMonthNumber;

  MonthModelBuild({this.dateTime});

  void setNecessaryProps() {
    // set date to first day of month
    firstDayOfMonth = dateTime.add(- (Duration(days: (dateTime.day -1))));

    // check what number of day of week have first day of month
    firstDayOfMonthNumber = firstDayOfMonth.weekday;

  }

  List<DateTime> buildModel() {
    this.setNecessaryProps();

    // this is needed only for first loop to set where in start of calendar
    int numberOfFirstDay = -1;

    // two dimension because is 7 days per week and sometimes needed is 6 row of calendar for one month
    var monthView = List.generate(42, (i) => DateTime.now(), growable: false);

    for (int i = 0; i < 42; i++) {
        if (numberOfFirstDay == -1) {
          switch (firstDayOfMonthNumber) {
            case 1:
              monthView[0] = firstDayOfMonth;
              numberOfFirstDay = 0;
              break;
            case 2:
              monthView[1] = firstDayOfMonth;
              numberOfFirstDay = 1;
              break;
            case 3:
              monthView[2] = firstDayOfMonth;
              numberOfFirstDay = 2;
              break;
            case 4:
              monthView[3] = firstDayOfMonth;
              numberOfFirstDay = 3;
              break;
            case 5:
              monthView[4] = firstDayOfMonth;
              numberOfFirstDay = 4;
              break;
            case 6:
              monthView[5] = firstDayOfMonth;
              numberOfFirstDay = 5;
              break;
            case 7:
              monthView[6] = firstDayOfMonth;
              numberOfFirstDay = 6;
              break;
            default:
              break;
          }
          i = numberOfFirstDay;
        } else {

          firstDayOfMonth = firstDayOfMonth.add(Duration(days: 1));
          monthView[i] = firstDayOfMonth;

        }
    }
    // set empty field before first day of month in monthView table
    if (numberOfFirstDay != 0) {
      firstDayOfMonth = dateTime.add(-(Duration(days: (dateTime.day - 1))));
      for (int i = numberOfFirstDay - 1; i >= 0; i--) {
        firstDayOfMonth = firstDayOfMonth.add(Duration(days: -1));
        monthView[i] = firstDayOfMonth;
      }
    }
    return monthView;
  }

}

