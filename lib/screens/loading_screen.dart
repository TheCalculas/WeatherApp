import 'package:flutter/material.dart';
import 'package:weatherapp/screens/location_screen.dart';
import 'package:weatherapp/services/location.dart';
import 'package:weatherapp/services/networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  double lat = 0;
  double lon = 0;
  Location geo = Location() ;
  void initState() {
    // TODO: implement initState
    super.initState();
    getInitLocation();
  }
  void getInitLocation() async{
    await geo.getLocation();
    lon = geo.longitude;
    lat = geo.latitude;
    NetworkHelper net = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=74d3bab32c3e263bb0012f1419093f22');

    var weatherData = await net.getData();
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return LocationScreen();
    }));
    String city = weatherData['name'];
    int id = weatherData['weather'][0]['id'];
    double temp = weatherData['main']['temp'];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: SpinKitCubeGrid(
              color: Colors.white,
              size: 100.0,
            ),
        ),
    );
  }
}
