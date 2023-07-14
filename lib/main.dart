import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'network.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'location.dart';
import 'weatherscreen.dart';


void main() {
  runApp(MaterialApp(
    title: 'Weather App',
    home: Scaffold(
      body: HomeScreen(),
    ),
  ));
}


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  void deactivate() {
    super.deactivate();
  }
  void getData() async {
    //Location location = Location();
    //await location.getCurrentLocation();
    await Future.delayed(Duration(seconds: 1));
    NetworkData networkData = NetworkData();
    await networkData.getWeatherData();
    await Future.delayed(Duration(seconds: 1));
    print(networkData.data);
    final String data = networkData.data;
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => WeatherScreen(data),
      ),);
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/home.jpg'),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(width: double.infinity,),
            SizedBox(
              height: MediaQuery.of(context).size.width,
            ),
            SpinKitWaveSpinner(
              color: Colors.red,
              waveColor: Colors.blue,
              size: 75,
            ),
            SizedBox(height: 10,),
            Text(
              'Loading Data...',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width/1.5,
            ),
            ElevatedButton(
                onPressed: () {
                    SystemNavigator.pop();
                },
              child: Text(
                'Exit',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}



