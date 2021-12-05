import 'package:bloc/bloc.dart';
import 'package:bloc_custom_firebase/services/fb_db.dart';
part 'invite_state.dart';

class InviteCubit extends Cubit<InviteState> {
  int n = 0;
  DataBaseService dataBaseService;
  InviteCubit({required this.dataBaseService}) : super(InviteInitial());

  void verifyinvite(String invite) async {
    emit(InviteLoad());
    bool verify = await dataBaseService.verifyinvite(invite);
    if (verify) {
      emit(Inviteverified());
    } else {
      emit(InviteError());
    }
  }

  void reload() {
    emit(InviteInitial());
    n = 0;
  }
}
