import 'package:conexio_dart_api/data/response/api_response.dart';
import 'package:conexio_dart_api/utils/routes/routes_name.dart';
import 'package:conexio_dart_api/utils/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../model/school/school_list_model.dart';
import '../../repository/school/home_repository_school.dart';

class HomeViewModelScholl with ChangeNotifier {
  final _myRepo = HomeRepositorySchool();

  bool _addLoading = false;
  bool get addLoading => _addLoading;

//TODO: para lo metodos post and put
  setAddLoading(bool value) {
    _addLoading = value;
    notifyListeners();
  }

//TODO: para lo metodos get
  ApiResponse<SchoolModelGet> schoolList = ApiResponse.loading();

  setSchoolList(ApiResponse<SchoolModelGet> response) {
    schoolList = response;
    notifyListeners();
  }

  Future<void> fechtSchoolListApi(String token) async {
    setSchoolList(ApiResponse.loading());

    _myRepo.fechtSchoolList(token).then((value) {
      setSchoolList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setSchoolList(ApiResponse.error(error.toString()));
    });
  }

  Future<void> addSchoolApi(
      dynamic data, String token, BuildContext context) async {
    setAddLoading(true);

    _myRepo.addSchoolApi(data, token).then((value) {
      setAddLoading(false);

      Utils.flushBarErrorMessage('Escuela Creada', context);

      Navigator.pushNamed(context, RoutesName.school);

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

  //Director put
  Future<void> putDataDirectorApi(
      String id, dynamic data, String token, BuildContext context) async {
    setPutLoading(true);

    _myRepo.putDataDirectorApi(id, data, token).then((value) {
      setPutLoading(false);

      Utils.toastMessage("Los Datos del Director han sido Actuzalizados");

      Navigator.pushNamed(context, RoutesName.school);
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

  //Supervisor
  Future<void> putDataSupervisorApi(
      String id, dynamic data, String token, BuildContext context) async {
    setPutLoading(true);

    _myRepo.putDataSupervisorApi(id, data, token).then((value) {
      setPutLoading(false);

      Utils.toastMessage("Los Datos del supervisor han sido Actuzalizados");

      Navigator.pushNamed(context, RoutesName.school);
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

  Future<void> putDataSchoolApi(
      String id, dynamic data, String token, BuildContext context) async {
    setAddLoading(true);

    _myRepo.putSchoolApi(id, data, token).then((value) {
      setPutLoading(false);

      Utils.toastMessage("Datos de la escula Actuzalizados");

      Navigator.pushNamed(context, RoutesName.school);
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
