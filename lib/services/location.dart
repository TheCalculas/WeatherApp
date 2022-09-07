import 'package:geolocator/geolocator.dart';

class Location {
  double longitude = 0;
  double latitude = 0;
  Future<void> getLocation() async {
    try {
      LocationPermission permission = await Geolocator.requestPermission();

      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      longitude = position.longitude;
      latitude = position.latitude;
      print(position);
    } catch (e) {
      print(e);
    }
  }

  void printLocation() {

    print('The longitude is :');
    print(longitude);
    print(latitude);
  }
}
