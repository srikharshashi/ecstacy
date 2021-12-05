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
    var location = await locationService.getlocation();
    var position = await locationService.getlatloc();
    print(location[0].locality.toString());
    emit(LocationSucess(
        location: location[0].locality.toString(), position: position));
  }

  void reload() {
    emit(LocationInitial());
  }
}
