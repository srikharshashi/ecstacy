import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'question_controller_state.dart';

class QuestionControllerCubit extends Cubit<QuestionControllerState> {
  QuestionControllerCubit() : super(QuestionsHome());

  Map<String, dynamic> data = {
    "bio": "",
    "pets": [],
    "music": [],
    "sports": [],
    "employment": "",
    "interest": []
  };

  void start() {
    emit(Questionsongoing());
  }

  void submit() {
    emit(QuestionLoad());
    //write the logic to register the user here
    //affter implementing a seperate map for data in the user object
    //also change questionasked to false
    
  }
}
