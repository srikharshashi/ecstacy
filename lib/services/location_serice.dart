import 'package:flutter_geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';

class LocationService {
  Future<String> getlocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    final addresses = await Geocoder.local.findAddressesFromCoordinates(
        Coordinates(position.latitude, position.longitude));
    String first = addresses.first.locality!;

    return first;
  }

  Future<Position> getlatloc() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    return position;
  }
}
