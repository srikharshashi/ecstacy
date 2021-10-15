import 'package:bloc/bloc.dart';
import 'package:bloc_custom_firebase/services/location_serice.dart';
part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit({required this.locationService}) : super(LocationInitial());

  LocationService locationService;

  void get_location() async {
    emit(LocationInitial());
    var location = await locationService.getlocation();
    print(location[0].locality.toString());
    emit(LocationSucess(location: location[0].locality.toString()));
  }
}
