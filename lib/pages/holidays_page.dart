import 'package:flutter/material.dart';
import 'package:flutter_futures/model/holiday.dart';
import 'package:flutter_futures/repository/holidays_repository.dart';

class HolidayPage extends StatefulWidget {
  @override
  _HolidayPageState createState() => _HolidayPageState();
}

class _HolidayPageState extends State<HolidayPage> {
  final _holidaysRepository = HolidaysRepository();
  List<Holiday> holidays = [];

  @override
  void initState() {
    getHolidays();
    super.initState();
  }

  void getHolidays() async {
    final holidays = await _holidaysRepository.getHolidays('US', 2019);

    setState(() {
      this.holidays = holidays;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Holidays'),
      ),
      body: Scrollbar(
        child: ListView.builder(
          itemCount: holidays.length,
          itemBuilder: (context, index) {
            final holiday = holidays[index];
            return ListTile(
              title: Text('${holiday.name}'),
              subtitle: Text('${holiday.date}'),
            );
          },
        ),
      ),
    );
  }
}
