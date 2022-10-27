import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mbernews/model/cnn_model.dart';
import 'package:mbernews/repository/repository.dart';

part 'republika_state.dart';

class RepublikaCubit extends Cubit<RepublikaState> {
  Repository repository;
  RepublikaCubit(this.repository) : super(RepublikaInitial());

  void getRepublika() async {
    try {
      emit(RepublikaLoading());
      CnnModel res = await repository.getRepublikaData();
      emit(RepublikaSuccess(res));
    } catch (e) {
      emit(RepublikaError(e.toString()));
    }
  }

  void getRepublikaByKategori(kategori) async {
    try {
      emit(RepublikaLoading());
      CnnModel res = await repository.getRepublikaKategori(kategori);
      emit(RepublikaSuccess(res));
    } catch (e) {
      emit(RepublikaError(e.toString()));
    }
  }
}
