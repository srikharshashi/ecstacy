import 'package:bloc/bloc.dart';
import 'package:bloc_custom_firebase/services/location_serice.dart';
import 'package:geolocator/geolocator.dart';
part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit({required this.locationService}) : super(LocationInitial()) {
    get_location();
  }

  LocationService locationService;

  void get_location() async {
    emit(LocationInitial());
    try {
      var permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }
      print(permission.toString());
      String location = await locationService.getlocation();
      var position = await locationService.getlatloc();
      print(location);
      emit(LocationSucess(location: location, position: position));
    } catch (e) {
      print(e.toString());
      emit(LocationError());
    }
  }

  void reload() {
    emit(LocationInitial());
  }
}
