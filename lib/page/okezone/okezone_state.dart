part of 'okezone_cubit.dart';

abstract class OkezoneState extends Equatable {
  const OkezoneState();
}

class OkezoneInitial extends OkezoneState {
  @override
  List<Object> get props => [];
}

class OkezoneLoading extends OkezoneState {
  @override
  List<Object> get props => [];
}

class OkezoneSuccess extends OkezoneState {
  List<Data> data;
  OkezoneSuccess(this.data);
  @override
  List<Object> get props => [data];
}

class OkezoneError extends OkezoneState {
  String msg;
  OkezoneError(this.msg);
  @override
  List<Object> get props => [msg];
}
