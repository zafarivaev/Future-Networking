class HolidaysResponse {
  final List<Holiday> holidays;

  HolidaysResponse({this.holidays});

  HolidaysResponse.fromJson(Map<String, dynamic> json)
      : holidays = json['holidays'];
}

class Holiday {
  final String name;
  final String date;

  Holiday({this.name, this.date});

  Holiday.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        date = json['date'];
}
