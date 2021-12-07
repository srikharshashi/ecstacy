part of 'question_controller_cubit.dart';

abstract class QuestionControllerState extends Equatable {
  const QuestionControllerState();

  @override
  List<Object> get props => [];
}

class QuestionsHome extends QuestionControllerState {}

class Questionsongoing extends QuestionControllerState{}


class QuestionLoad extends QuestionControllerState{}

class QuestionsSuccess extends QuestionControllerState{}