import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mbernews/model/cnn_model.dart';
import 'package:mbernews/repository/repository.dart';

part 'cnn_state.dart';

class CnnCubit extends Cubit<CnnState> {
  Repository repository;
  CnnCubit(this.repository) : super(CnnInitial());
  int jumlah = 25;
  late CnnModel dataAsli;
  void getData() async {
    try {
      emit(CnnLoading());
      var data = await repository.getCnnData();
      dataAsli = data;
      filter();
    } catch (e) {
      emit(CnnError(e.toString()));
    }
  }

  void getDataKategori(kategori) async {
    try {
      emit(CnnLoading());
      CnnModel data = await repository.getCnnKategori(kategori);
      emit(CnnSuccess(data.data!));
    } catch (e) {
      emit(CnnError(e.toString()));
    }
  }

  void filter() {
    List<Data> dataFilter = dataAsli.data!.take(jumlah).toList();
    emit(CnnSuccess(dataFilter));
    jumlah += 25;
  }
}

class CnnLoadLagiCubit extends Cubit<bool> {
  CnnLoadLagiCubit() : super(false);

  void isShowed(kondisi) {
    emit(kondisi);
  }
}
