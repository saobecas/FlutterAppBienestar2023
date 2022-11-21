import 'package:conexio_dart_api/data/network/base_api_service.dart';
import 'package:conexio_dart_api/data/network/network_api_service.dart';
import 'package:conexio_dart_api/model/municipio/municipio_list_model.dart';

import '../../res/api_url.dart';

class HomeRepositoryMunicipio {
  BaseApiService _apiServices = NetworkApiService();

  Future<MunicipioModelGet> fechtMunicipioList() async {
    try {
      dynamic response = await _apiServices
          .getGetApiResponse(AppUrl.municipioListGellAllEndPoint);

      return response = MunicipioModelGet.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}
