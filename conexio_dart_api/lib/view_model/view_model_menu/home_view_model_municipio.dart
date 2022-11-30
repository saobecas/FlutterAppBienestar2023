import 'package:conexio_dart_api/data/response/api_response.dart';
import 'package:conexio_dart_api/model/municipio/municipio_list_model.dart';
import 'package:conexio_dart_api/repository/repository_crud/home_repositoru_municipio.dart';
import 'package:conexio_dart_api/utils/routes/routes_name.dart';
import 'package:conexio_dart_api/utils/utils.dart';
import 'package:flutter/foundation.dart';
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

  bool _addLoading = false;
  bool get addLoading => _addLoading;
  setAddLoading(bool value) {
    _addLoading = value;
    notifyListeners();
  }

  Future<void> addMunicipioApi(dynamic data, BuildContext context) async {
    setAddLoading(true);
    _muyRepo.addMunicipioApi(data).then((value) {
      setAddLoading(false);
      Utils.flushBarErrorMessage('Municipio agregado', context);
      Navigator.pushNamed(context, RoutesName.municipio);

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
