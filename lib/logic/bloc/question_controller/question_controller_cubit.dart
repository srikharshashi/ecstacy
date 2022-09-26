import 'package:bloc/bloc.dart';
import 'package:bloc_custom_firebase/logic/models/user_model.dart';
import 'package:bloc_custom_firebase/services/fb_auth_service.dart';
import 'package:bloc_custom_firebase/services/fb_db.dart';
import 'package:equatable/equatable.dart';

part 'question_controller_state.dart';

class QuestionControllerCubit extends Cubit<QuestionControllerState> {
  QuestionControllerCubit(
      {required this.dataBaseService, required this.fb_service})
      : super(QuestionsHome());
  DataBaseService dataBaseService;
  FB_Service fb_service;
  Map<String, dynamic> data = {
    "bio": "",
    "pets": [],
    "genres": [],
    "sports": [],
    "employment": "",
    "interest": []
  };

  void start() {
    emit(Questionsongoing());
  }

  void submit() async {
    emit(QuestionLoad());
    String email = fb_service.get_user_email();
    bool val = await dataBaseService.updatedata(data, email);
    if (val) {
      var usermap = await dataBaseService.getusermap(email);
      emit(QuestionsSuccess(user: User.frommap(usermap)));
    } else {
      emit(QuestionError());
    }
  }
}
