import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wheather_app/weathermodel.dart';

class WeatherData{
  Future<Weather>getData(var latitude, var longitude) async{
    var uricall = Uri.parse('http://api.weatherapi.com/v1/current.json?key=fa373a3f085e4690b5862639231008&q=$latitude,$longitude&aqi=no');
  var response = await http.get(uricall);
  var body = jsonDecode(response.body);
  return Weather.fromJson(body);
  }

  
}