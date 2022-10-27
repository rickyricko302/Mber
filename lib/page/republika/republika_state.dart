part of 'republika_cubit.dart';

abstract class RepublikaState extends Equatable {
  const RepublikaState();
}

class RepublikaInitial extends RepublikaState {
  @override
  List<Object> get props => [];
}

class RepublikaLoading extends RepublikaState {
  @override
  List<Object> get props => [];
}

class RepublikaSuccess extends RepublikaState {
  CnnModel data;
  RepublikaSuccess(this.data);
  @override
  List<Object> get props => [data];
}

class RepublikaError extends RepublikaState {
  String msg;
  RepublikaError(this.msg);
  @override
  List<Object> get props => [msg];
}
