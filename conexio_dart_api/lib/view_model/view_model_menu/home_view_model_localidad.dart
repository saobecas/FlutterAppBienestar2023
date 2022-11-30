import 'package:conexio_dart_api/model/localidad/localidad_list_model.dart';
import 'package:conexio_dart_api/repository/repository_crud/home_repository_localidad.dart';
import 'package:conexio_dart_api/utils/routes/routes_name.dart';
import 'package:conexio_dart_api/utils/utils.dart';
import 'package:flutter/foundation.dart';
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

  bool _addLoading = false;
  bool get addLoading => _addLoading;
  setAddLoading(bool value) {
    _addLoading = value;
    notifyListeners();
  }

  Future<void> addLocalidadApi(dynamic data, BuildContext context) async {
    setAddLoading(true);
    _myRepo.addLocalidadApi(data).then((value) {
      setAddLoading(false);
      Utils.flushBarErrorMessage('Localidad agregado', context);
      Navigator.pushNamed(context, RoutesName.localidad);

      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setAddLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
