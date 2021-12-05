import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'question_controller_state.dart';

class QuestionControllerCubit extends Cubit<QuestionControllerState> {
  QuestionControllerCubit() : super(QuestionsHome());

    
  
}
