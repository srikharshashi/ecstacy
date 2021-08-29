part of 'gender_cubit.dart';

abstract class GenderState extends Equatable {
  const GenderState();
  @override
  List<Object> get props => [];
}

class GenderInitial extends GenderState {}

class MaleSelect extends GenderState {}

class FemaleSelect extends GenderState {}

class OtherSelect extends GenderState{}
