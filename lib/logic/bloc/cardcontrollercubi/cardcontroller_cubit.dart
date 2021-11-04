import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'cardcontroller_state.dart';

class CardcontrollerCubit extends Cubit<CardcontrollerState> {
  CardcontrollerCubit() : super(CardcontrollerInitial());

  Offset _position = Offset.zero;

  Offset get position => _position;

  void startPosition(DragStartDetails details) {}

  void updatePosition(DragUpdateDetails details) {
    _position += details.delta;
  }

  void endPosition() {}
}
