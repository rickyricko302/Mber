import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mbernews/repository/repository.dart';

import '../../model/cnn_model.dart';

part 'okezone_state.dart';

class OkezoneCubit extends Cubit<OkezoneState> {
  Repository repository;
  OkezoneCubit(this.repository) : super(OkezoneInitial());
  late CnnModel dataAsli;
  int jumlah = 25;

  void getOkezoneData() async {
    try {
      emit(OkezoneLoading());
      var data = await repository.getOkezone();
      dataAsli = data;
      filter();
    } catch (e) {
      emit(OkezoneError(e.toString()));
    }
  }

  void getOkezoneByKategori(kategori) async {
    try {
      emit(OkezoneLoading());
      CnnModel data = await repository.getOkezoneKategori(kategori);
      emit(OkezoneSuccess(data.data!));
    } catch (e) {
      emit(OkezoneError(e.toString()));
    }
  }

  void filter() {
    List<Data> dataFilter = dataAsli.data!.take(jumlah).toList();
    emit(OkezoneSuccess(dataFilter));
    jumlah += 25;
  }
}

class OkezoneLoadLagiCubit extends Cubit<bool> {
  OkezoneLoadLagiCubit() : super(false);

  void isShowed(kondisi) {
    emit(kondisi);
  }
}
