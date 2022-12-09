import 'package:conexio_dart_api/data/response/api_response.dart';
import 'package:conexio_dart_api/model/region/region_list_model.dart';
import 'package:conexio_dart_api/model/region/region_model_get_id.dart';
import 'package:conexio_dart_api/repository/repository_crud/home_repository_region.dart';
import 'package:conexio_dart_api/utils/routes/routes_name.dart';
import 'package:conexio_dart_api/utils/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomeViewModelRegion with ChangeNotifier {
  final _myRepo = HomeRepositoryRegion();

  bool _addLoading = false;
  bool get addLoading => _addLoading;

  setAddLoading(bool value) {
    _addLoading = value;
    notifyListeners();
  }

/* metodos gets */
  ApiResponse<RegionModelGet> regionList = ApiResponse.loading();

  setRegionList(ApiResponse<RegionModelGet> response) {
    regionList = response;
    notifyListeners();
  }

  Future<void> fechtRegionListApi(
    String token,
  ) async {
    setRegionList(ApiResponse.loading());

    _myRepo.fechtRegionList(token).then((value) {
      setRegionList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setRegionList(ApiResponse.error(error.toString()));
    });
  }

// metodo get id

  ApiResponse<ModelRegionGetId> regionIdList = ApiResponse.loading();

  setRegionIdList(ApiResponse<ModelRegionGetId> response) {
    regionIdList = response;
    notifyListeners();
  }

  Future<void> fechtIdRegionListApi(
    String id,
    String token,
  ) async {
    setRegionIdList(ApiResponse.loading());

    _myRepo.fechtRegionIdDetails(id, token).then((value) {
      setRegionIdList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setRegionIdList(ApiResponse.error(error.toString()));
    });
  }

  Future<void> addRegionApi(
      dynamic data, String token, BuildContext context) async {
    setAddLoading(true);

    _myRepo.addRegionApi(data, token).then((value) {
      setAddLoading(false);

      //  Utils.flushBarErrorMessage('Region Creada', context);
      Utils.toastMessage('Region Agregada');
      Navigator.pushNamed(context, RoutesName.region);

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

  bool _putLoading = false;
  bool get putLoading => _putLoading;

  setPutLoading(bool value) {
    _putLoading = value;
    notifyListeners();
  }

  Future<void> putRegionApi(
      String id, dynamic data, String token, BuildContext context) async {
    setAddLoading(true);

    _myRepo.putRegionApi(id, data, token).then((value) {
      setPutLoading(false);
//*****TODO: Cambiar a toastMessage en todos los metodos
      //Utils.flushBarErrorMessage('Region Actuzalizada', context);
      Utils.toastMessage("Region Actuzalizada");

      //Navigator.pushNamed(context, RoutesName.regionPut);
      Navigator.pushNamed(context, RoutesName.region);
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

  bool _deleteLoading = false;
  bool get deleteLoading => _deleteLoading;

  setDeleteLoading(bool value) {
    _deleteLoading = value;
    notifyListeners();
  }

  Future<void> deleteRegionApi(
      String id, String token, BuildContext context) async {
    setDeleteLoading(true);

    _myRepo.deleteRegionApi(id, token).then((value) {
      setDeleteLoading(false);
      Utils.toastMessage("Region Eliminada");

      //Navigator.pushNamed(context, RoutesName.regionPut);
      Navigator.pushNamed(context, RoutesName.region);
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError(
      (error, stackTrace) {
        // setDeleteLoading(false);
        Utils.flushBarErrorMessage(error.toString(), context);
        if (kDebugMode) {
          print(error.toString());
        }
      },
    );
  }
/*
  Future<void> addProtecRegionApi(
      dynamic data, String token, BuildContext context) async {
    setAddLoading(true);

    _myRepo.addProtecRegionApi(data, token).then((value) {
      setAddLoading(false);

      //  Utils.flushBarErrorMessage('Region Creada', context);
      Utils.toastMessage('Region Agregada');
      Navigator.pushNamed(context, RoutesName.region);

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
  }*/
}
