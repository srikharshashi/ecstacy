part of 'invite_cubit.dart';

abstract class InviteState {}

class InviteInitial extends InviteState {}

class InviteLoad extends InviteState {}

class Inviteverified extends InviteState {}

class InviteError extends InviteState {}
