import 'package:conexio_dart_api/model/localidad/localidad_list_model.dart';
import 'package:conexio_dart_api/repository/repository_crud/home_repository_localidad.dart';
import 'package:flutter/material.dart';

import '../../data/response/api_response.dart';

class HomeViewModelLocalidad with ChangeNotifier {
  final _myRepo = HomeRepositoryLocalidad();

  ApiResponse<LocalidadModelGet> localidadList = ApiResponse.loading();

  setLocalidadList(ApiResponse<LocalidadModelGet> response) {
    localidadList = response;
    notifyListeners();
  }

  Future<void> fechtLocalidadListApi() async {
    setLocalidadList(ApiResponse.loading());

    _myRepo.fechtLocalidadList().then((value) {
      setLocalidadList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setLocalidadList(ApiResponse.error(error.toString()));
    });
  }
}
