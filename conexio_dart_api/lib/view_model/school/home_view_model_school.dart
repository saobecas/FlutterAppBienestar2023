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

  Future<void> fechtSchoolListApi() async {
    setSchoolList(ApiResponse.loading());

    _myRepo.fechtSchoolList().then((value) {
      setSchoolList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setSchoolList(ApiResponse.error(error.toString()));
    });
  }

  Future<void> addSchoolApi(dynamic data, BuildContext context) async {
    setAddLoading(true);

    _myRepo.addSchoolApi(data).then((value) {
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
}
