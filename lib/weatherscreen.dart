import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

late double temperature;
late String weather;
late String city;
late String description;
late String bg;
late int humidity;
late double temp_min;
late double temp_max;

class WeatherScreen extends StatefulWidget {
  late String data;
  WeatherScreen(this.data);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState(data);
}

class _WeatherScreenState extends State<WeatherScreen> {
  late String data;
  _WeatherScreenState(this.data);

  @override
  void initState() {
    super.initState();
    getInfo(data);
    screenData();
  }

  void getInfo(String data){
    var decodedData = jsonDecode(data);
    weather = decodedData["weather"][0]["main"];
    temperature = decodedData["main"]["temp"];
    city = decodedData["name"];
    description = decodedData["weather"][0]["description"];
    humidity = decodedData["main"]["humidity"];
    temp_min = decodedData["main"]["temp_min"];
    temp_max = decodedData["main"]["temp_max"];
    print(weather);
    print(temperature);
    print(city);
    print(description);
    print(humidity);
    print(temp_min);
    print(temp_max);
  }

  void screenData(){
    if(weather == "Clear"){
      bg = 'images/clear.jpg';
    }
    else if(weather == "Rain"){
      bg = 'images/rainy.jpeg';
    }
    else if(weather == "Haze"){
      bg = 'images/haze.jpg';
    }
    else if(weather == "Clouds"){
      bg = 'images/clouds.jpg';
    }
    else if(weather == "Mist"){
      bg = 'images/mist.jpg';
    }
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(bg),
                fit:  BoxFit.fill,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  SizedBox(width:  MediaQuery.of(context).size.width/1.2,),
                  FloatingActionButton(
                    onPressed: () {
                      //Navigator.pop(context);
                      SystemNavigator.pop();
                    },
                    child: Icon(
                      Icons.close,
                    ),
                    backgroundColor: Color(0x36454F).withOpacity(0.25),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.width/4,),
              Container(
                  width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(left: 20),
                  child: Text(
                    city,
                    style: TextStyle(
                      fontSize: 28,
                      //fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  )
              ),
              Container(
                  width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(left: 20),
                  child: Text(
                    temperature.toString()+"°",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 100,
                    ),
                  )
              ),
              Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(left: 25),
                  child: Text(
                    description,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  )
              ),
              SizedBox(height: MediaQuery.of(context).size.width,),
              Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(left: 20.0, right: 20.0),
              padding: EdgeInsets.all(28.0),
              decoration: new BoxDecoration(
              color:   const Color(0x36454F).withOpacity(0.5),//here i want to add opacity
              border: new Border.all(color: Colors.white70,
               ),
               borderRadius: BorderRadius.all(Radius.circular(40.0)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(
                        humidity.toString() + " %",
                        style: TextStyle(
                          //fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                      Text(
                        'Humidity',
                        style: TextStyle(
                          color: Colors.white,
                          //fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        temp_min.toString() + "°",
                        style: TextStyle(
                          //fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                      Text(
                        'Minimum',
                        style: TextStyle(
                          color: Colors.white,
                          //fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        temp_max.toString() + "°",
                        style: TextStyle(
                          //fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                      Text(
                        'Maximum',
                        style: TextStyle(
                          color: Colors.white,
                          //fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      )
                    ],
                  ),

                ],
              ),
            ),
            ],
          ),
        ],
      ),
    );
  }
}