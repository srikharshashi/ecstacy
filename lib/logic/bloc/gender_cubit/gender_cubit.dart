import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'gender_state.dart';

class GenderCubit extends Cubit<GenderState> {
  GenderCubit() : super(GenderInitial());

  void maleSelect() {
    emit(MaleSelect());
  }

  void femaleSelect() {
    emit(FemaleSelect());
  }

  void otherselect() {
    emit(OtherSelect());
  }

  void reset() {
    emit(GenderInitial());
  }
}
