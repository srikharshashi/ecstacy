part of 'location_cubit.dart';

abstract class LocationState {}

class LocationInitial extends LocationState {
  //Attempting to get location , make sure you give us permissions!
}

class LocationError extends LocationState {
  //location access was denied please enable location and allot permissions
}

class LocationSucess extends LocationState {
  String location;
  Position position;
  LocationSucess({
    required this.location,
    required this.position
  });
  //Got the location
}
