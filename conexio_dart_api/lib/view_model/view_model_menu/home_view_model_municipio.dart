import 'package:conexio_dart_api/data/response/api_response.dart';
import 'package:conexio_dart_api/model/municipio/municipio_list_model.dart';
import 'package:conexio_dart_api/repository/repository_crud/home_repositoru_municipio.dart';
import 'package:flutter/material.dart';

class HomeViewModelMunicipio with ChangeNotifier {
  final _muyRepo = HomeRepositoryMunicipio();

  ApiResponse<MunicipioModelGet> municipioList = ApiResponse.loading();

  setMunicipioList(ApiResponse<MunicipioModelGet> response) {
    municipioList = response;
    notifyListeners();
  }

  Future<void> fechtMunicipioListApi() async {
    setMunicipioList(ApiResponse.loading());

    _muyRepo.fechtMunicipioList().then((value) {
      setMunicipioList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setMunicipioList(ApiResponse.error(error.toString()));
    });
  }
}
