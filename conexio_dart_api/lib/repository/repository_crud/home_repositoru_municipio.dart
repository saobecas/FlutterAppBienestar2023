import 'package:conexio_dart_api/data/network/base_api_service.dart';
import 'package:conexio_dart_api/data/network/network_api_service.dart';
import 'package:conexio_dart_api/model/municipio/municipio_list_model.dart';

import '../../res/api_url.dart';

class HomeRepositoryMunicipio {
  BaseApiService _apiServices = NetworkApiService();

  Future<MunicipioModelGet> fechtMunicipioList(String token) async {
    try {
      dynamic response = await _apiServices.getGetApiResponse(
          AppUrl.municipioListGellAllEndPoint, token);

      return response = MunicipioModelGet.fromJson(response);
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> addMunicipioApi(dynamic data, String token) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(
          AppUrl.addMunicipioEndPoint, data, token);
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> putMunicipioApi(String id, dynamic data, String token) async {
    try {
      dynamic response = await _apiServices.getPutApiResponse(
          AppUrl.municipioUpdateAllEndPoint, id, data, token);
      print("putRegionApi: ${id}");
      print(response);
      return response;
    } catch (e) {
      kDebugMode() {
        print("Respuesyta: ....$e");
      }

      throw e;
    }
  }
}
