import 'package:conexio_dart_api/model/data_user_id_model.dart';
import 'package:conexio_dart_api/model/user_model.dart';
import 'package:conexio_dart_api/utils/routes/routes_name.dart';
import 'package:conexio_dart_api/utils/utils.dart';
import 'package:conexio_dart_api/view_model/user_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/response/api_response.dart';
import '../model/user_list_model.dart';
import '../repository/home_repository.dart';

class HomeViewModel with ChangeNotifier {
  final _myRepo = HomeRepository();

  ApiResponse<UserListModel> userList = ApiResponse.loading();

  setUserList(ApiResponse<UserListModel> response) {
    userList = response;
    notifyListeners();
  }

  bool _getIdLoading = false;
  bool get getIdLoading => _getIdLoading;

  setGetIdLoading(bool value) {
    _getIdLoading = value;
    notifyListeners();
  }

  Future<void> fetchUserDataApi(
      String id, String token, BuildContext context) async {
    //setUserData(ApiResponse.loading());
    setGetIdLoading(true);
    _myRepo.fechUserDataId(id, token).then((value) {
      print("FechidUser: $value");
      //setUserData(ApiResponse.completed(value));
      Utils.toastMessage('user Id Data Successful');
      Navigator.pushNamed(context, RoutesName.home);

      /* if (kDebugMode) {
        print(value.toString());
      }*/
      setGetIdLoading(false);
    }).onError((error, stackTrace) {
      //setUserData(ApiResponse.error(error.toString()));
      setGetIdLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }

  Future<void> fetchUserListApi(String token) async {
    setUserList(ApiResponse.loading());

    _myRepo.fetchUserList(token).then((value) {
      setUserList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setUserList(ApiResponse.error(error.toString()));
    });
  }

  bool _putLoading = false;
  bool get putLoading => _putLoading;

  setPutLoading(bool value) {
    _putLoading = value;
    notifyListeners();
  }

  Future<void> putUserPassword(
      String id, dynamic data, String token, BuildContext context) async {
    setPutLoading(true);

    _myRepo.putPasswordApi(id, data, token).then((value) {
      setPutLoading(false);

      Utils.toastMessage("Contraseña Actualizada");

      Navigator.pushNamed(context, RoutesName.login);
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setPutLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }

  Future<void> putEmployeeData(
      String id, dynamic data, String token, BuildContext context) async {
    setPutLoading(true);

    _myRepo.putEmployeeDataApi(id, data, token).then((value) {
      setPutLoading(false);

      Utils.toastMessage("Datos Actualizados");

      Navigator.pushNamed(context, RoutesName.login);
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setPutLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
