import 'package:bloc/bloc.dart';
import 'package:bloc_custom_firebase/services/fb_auth_service.dart';
import 'package:meta/meta.dart';

part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit({required this.repossitory}) : super(LogoutInitial());
  FB_Service repossitory;

  void logout() async {
    bool result = await repossitory.logout();

    if (result)
      emit(LogOutSucess());
    else
      emit(LogOutFailed());
  }
}
