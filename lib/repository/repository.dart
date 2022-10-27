import 'dart:convert';

import 'package:mbernews/model/cnn_model.dart';

import 'package:http/http.dart' as http;

class Repository {
  final String BASE_URL = "https://berita-indo-api.vercel.app/v1/";

  Future getCnnData() async {
    var res = await http.get(Uri.parse(BASE_URL + "/cnn-news"));
    if (res.statusCode == 200) {
      return CnnModel.fromJson(jsonDecode(res.body));
    } else {
      throw Exception("Failed load data, code " + res.statusCode.toString());
    }
  }

  Future getCnnKategori(kategori) async {
    var res = await http.get(Uri.parse(BASE_URL + "/cnn-news/" + kategori));
    if (res.statusCode == 200) {
      return CnnModel.fromJson(jsonDecode(res.body));
    } else {
      throw Exception("Failed load data, code " + res.statusCode.toString());
    }
  }

  Future getRepublikaData() async {
    var res = await http.get(Uri.parse(BASE_URL + "/republika-news"));
    if (res.statusCode == 200) {
      return CnnModel.fromJson(jsonDecode(res.body));
    } else {
      throw Exception("Failed load data, code " + res.statusCode.toString());
    }
  }

  Future getRepublikaKategori(kategori) async {
    var res =
        await http.get(Uri.parse(BASE_URL + "/republika-news/" + kategori));
    if (res.statusCode == 200) {
      return CnnModel.fromJson(jsonDecode(res.body));
    } else {
      throw Exception("Failed load data, code " + res.statusCode.toString());
    }
  }

  Future getOkezone() async {
    var res = await http.get(Uri.parse(BASE_URL + "/okezone-news/"));
    if (res.statusCode == 200) {
      return CnnModel.fromJson(jsonDecode(res.body));
    } else {
      throw Exception("Failed load data, code " + res.statusCode.toString());
    }
  }

  Future getOkezoneKategori(kategori) async {
    var res = await http.get(Uri.parse(BASE_URL + "/okezone-news/" + kategori));
    if (res.statusCode == 200) {
      return CnnModel.fromJson(jsonDecode(res.body));
    } else {
      throw Exception("Failed load data, code " + res.statusCode.toString());
    }
  }
}
