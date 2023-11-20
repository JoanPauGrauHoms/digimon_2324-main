// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';
import 'dart:io';
import 'dart:async';

class Footballer {
  final String name;
  String? imageUrl;
  String? apiname;
  String? teamFootballer;

  int rating = 10;

  Footballer(this.name);

  Future getImageUrl() async {
    if (imageUrl != null) {
      return;
    }

    HttpClient http = HttpClient();
    try {
      apiname = name;

      var uri = Uri.https('654e542dcbc325355742c19c.mockapi.io', '/api/Players/$apiname');
      var request = await http.getUrl(uri);
      var response = await request.close();
      var responseBody = await response.transform(utf8.decoder).join();

      Map<String, dynamic> data = json.decode(responseBody);
      imageUrl = data["img"];
      teamFootballer = data["team"];

    } catch (exception) {
      print(exception);
    }
  }
}
