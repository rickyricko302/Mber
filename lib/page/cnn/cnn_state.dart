part of 'cnn_cubit.dart';

abstract class CnnState extends Equatable {
  const CnnState();
}

class CnnInitial extends CnnState {
  @override
  List<Object> get props => [];
}

class CnnLoading extends CnnState {
  @override
  List<Object> get props => [];
}

class CnnSuccess extends CnnState {
  List<Data> data;
  CnnSuccess(this.data);
  @override
  List<Object> get props => [data];
}

class CnnError extends CnnState {
  String msg;
  CnnError(this.msg);
  @override
  List<Object> get props => [msg];
}
