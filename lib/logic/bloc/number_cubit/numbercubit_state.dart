part of 'numbercubit.dart';

abstract class NumberState extends Equatable {
  const NumberState();

  @override
  List<Object> get props => [];
}
//let us give thse codes in the order of the events they occur so that the buttton can recongnize what in the worl is happenening

class NumbercubitInitial extends NumberState {
//code ==0
} //buildre done ,button done

class NumberLoad extends NumberState {
  // code==1
} //builder done

class GetOTP extends NumberState {
  // code==2
} //builder done ,button done

class LoginError extends NumberState {
  // code == -1
} //builder done

class NumberRegistered extends NumberState {
  // code ==3
}//implement listner