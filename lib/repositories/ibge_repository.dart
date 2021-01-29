import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xlo_mobx/models/city.dart';
import 'package:xlo_mobx/models/uf.dart';

class IBGERepository {
  Future<List<UF>> getUFListFromApi() async {
    final preferences = await SharedPreferences.getInstance();

    if (preferences.containsKey('UF_LIST')) {
      final j = json.decode(preferences.getString('UF_LIST'));

      return j.map<UF>((e) => UF.fromJson(e)).toList()
        ..sort((UF a, UF b) => a.name.compareTo(b.name.toLowerCase()));
    }

    const endpoint =
        "https://servicodados.ibge.gov.br/api/v1/localidades/estados";

    try {
      final response = await Dio().get<List>(endpoint);

      preferences.setString('UF_LIST', json.encode(response.data));

      final uflist = response.data.map<UF>((j) => UF.fromJson(j)).toList()
        ..sort((a, b) => a.name.compareTo(b.name.toLowerCase()));

      return uflist;
    } on DioError {
      return Future.error("Falha ao obter lista de estados");
    }
  }

  getCityListFromApi(UF uf) async {
    String endpoint = "https://servicodados.ibge.gov.br/api/v1/localidades/estados/${uf.id}/municipios";

    try {
      final response = await Dio().get<List>(endpoint);
      final cityList = response.data.map<City>((j) => City.fromJson(j)).toList()
        ..sort((a, b) => a.name.compareTo(b.name.toLowerCase()));

      return cityList;
    } on DioError {
      return Future.error("Falha ao obter lista de municípios");
    }
  }
}
