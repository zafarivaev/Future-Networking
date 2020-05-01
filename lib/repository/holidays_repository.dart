import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter_futures/utils/api_keys.dart';
import 'package:flutter_futures/model/holiday.dart';
import 'package:flutter_futures/utils/base_urls.dart';
import 'package:flutter_futures/utils/endpoints.dart';

class HolidaysRepository {
  final _client = http.Client();

  List<Holiday> parseHolidays(String responseBody) {
    final holidaysJSON = jsonDecode(responseBody)['holidays'] as List;

    final List<Holiday> holidaysList = holidaysJSON
        .map((holidayJSON) => Holiday.fromJson(holidayJSON))
        .toList();

    return holidaysList;
  }

  Future<List<Holiday>> getHolidays(String country, int year) async {
    final Map<String, String> parameters = {
      'country': country,
      'year': year.toString(),
      'key': APIKeys.holidays
    };

    var fullUri = Uri.https(BaseUrls.holidays, Endpoints.holidays, parameters);
    print("Full: $fullUri");

    try {
      final response = await _client.get(fullUri);
      return parseHolidays(response.body);
    } catch (error) {
      print(error);
      return [];
    }
  }
}
