import 'dart:convert';

import 'package:http/http.dart' as http;
import 'location.dart';

const apiKey = '0d1ff8290f763d60d531202d814ad800';
class NetworkData{

  late String data;
  Future<void> getWeatherData() async{
    Location location = Location();
    await location.getCurrentLocation();
    double latitude = location.latitude;
    double longitude = location.longitude;
    http.Response response = await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric'));

    if(response.statusCode==200){
      data = response.body;
      print(response.statusCode);
    }
  }
}