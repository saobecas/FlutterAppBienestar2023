import 'package:conexio_dart_api/model/data_user_id_model.dart';

import '../data/network/base_api_service.dart';
import '../data/network/network_api_service.dart';
import '../model/user_list_model.dart';
import '../res/api_url.dart';

class HomeRepository {
  BaseApiService _apiServices = NetworkApiService();

  Future<UserListModel> fetchUserList(String token) async {
    try {
      dynamic response = await _apiServices.getGetApiResponse(
          AppUrl.userListGellAllEndPoint, token);
      return response = UserListModel.fromJson(response);
    } catch (e) {
      //rethrow;
      throw e;
    }
  }

  Future<dynamic> putPasswordApi(String id, dynamic data, String token) async {
    try {
      dynamic response = await _apiServices.getPutApiResponse(
          AppUrl.userUpdatePassword, id, data, token);
      print("putRegionApi: ${id}");
      print(response);
      return response;
    } catch (e) {
      kDebugMode() {
        print("Respuesta: ....$e");
      }

      rethrow;
    }
  }

  Future<dynamic> fechUserDataId(String id, String token) async {
    try {
      dynamic response = await _apiServices.getGetIdApiResponse(
          AppUrl.userIdDataEndPoint, id, token);
      //print("fechUserDataId: ${id}");

      return response;
    } catch (e) {
      kDebugMode() {
        print("Respuesyta: ....$e");
      }

      rethrow;
    }
  }
}
