import 'package:conexio_dart_api/data/network/base_api_service.dart';
import 'package:conexio_dart_api/data/network/network_api_service.dart';
import 'package:conexio_dart_api/model/localidad/localidad_list_model.dart';

import '../../res/api_url.dart';

class HomeRepositoryLocalidad {
  BaseApiService _apiServices = NetworkApiService();

  Future<LocalidadModelGet> fechtLocalidadList() async {
    try {
      dynamic response = await _apiServices
          .getGetApiResponse(AppUrl.localidadListGellAllEndPoint);

      return response = LocalidadModelGet.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}
